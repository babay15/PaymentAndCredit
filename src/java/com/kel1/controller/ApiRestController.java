/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kel1.controller;

import com.kel1.bean.DataDTO;
import com.kel1.bean.Kiriman;
import com.kel1.dao.CashDao;
import com.kel1.dao.CreditDAO;
import com.kel1.dao.CustomerDao;
import com.kel1.entity.Cash;
import com.kel1.entity.Customer;
import com.kel1.entity.Payment;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author user
 */
@RestController
@RequestMapping("api")
public class ApiRestController {
    
    @Autowired
    CustomerDao customerDao;
    @Autowired
    CreditDAO creditDao;
    @Autowired
    CashDao cashDao;
    
    @RequestMapping(value="/person", method = RequestMethod.POST)
    public Kiriman getPerson(@RequestBody DataDTO dataDTO){
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        Kiriman kiriman = new Kiriman();
        DataDTO dataConsume = dataDTO;
        Customer customer = new Customer();
        Payment payment = new Payment();
        com.kel1.entity.Credit credit;
        Cash cash;
        
        if(dataConsume.getIsCredit()==0){
            cash = new Cash();
            customer.setCustomerName(dataConsume.getPembeli());
            customer.setCustomerAddress(dataConsume.getAlamat());
            customer.setCustomerTelepon(dataConsume.getTelp());
            customer.setCustomerCreatedby("admin");
            customer.setCustomerCreatedtime(sdf.format(new Date()));
            customer.setCustomerFlag("y");
            customer.setPayment(payment);
            
            //GENERATE 3 ANGKA
            double angkaGenerate = Math.floor(dataConsume.getTotalHarga() + Math.random()*999);
            
            payment.setPaymentPrice(angkaGenerate);
            payment.setPaymentFlag("y");
            payment.setPaymentCreatedby("admin");
            payment.setPaymentCreatedtime(sdf.format(new Date()));
            payment.setCash(cash);
            payment.setCustomerId(customer);
            
            cash.setCashPrice(angkaGenerate);
            cash.setPaymentId(payment);
            cash.setCashStatus("Unpaid");
            cash.setCashDate(sdf.format(new Date()));
            cash.setCashCreatedby("admin");
            cash.setCashCreatedtime(sdf.format(new Date()));
            
            customerDao.saveAllCash(customer, payment, cash);
            
            kiriman.setTipe("CASH");
            kiriman.setTotal(angkaGenerate);
            
        }else if(dataConsume.getIsCredit()==1){
            if(dataConsume.getTotalHarga()<1000000){
                kiriman.setInformasi("HARGA TERLALU KECIL, KREDIT DITOLAK");
            }
            else if(dataConsume.getTotalHarga()>=1000000){
            credit = new com.kel1.entity.Credit();
            
            customer.setCustomerName(dataConsume.getPembeli());
            customer.setCustomerAddress(dataConsume.getAlamat());
            customer.setCustomerTelepon(dataConsume.getTelp());
            customer.setCustomerCreatedby("admin");
            customer.setCustomerCreatedtime(sdf.format(new Date()));
            customer.setCustomerFlag("y");
            customer.setPayment(payment);
            
            
            payment.setPaymentPrice(dataDTO.getTotalHarga());
            payment.setPaymentFlag("y");
            payment.setPaymentCreatedby("admin");
            payment.setPaymentCreatedtime(sdf.format(new Date()));
            payment.setCredit(credit);
            payment.setCustomerId(customer);
            
            double hargaAwal = dataConsume.getTotalHarga();
            double uangMuka = dataConsume.getUang_muka();
            double pokokCicilan = hargaAwal - uangMuka;
            int durasi = 6; //MASIH DISET MANUAL
            double persentaseBunga = 0.1;
            double bungaCicilan = ((pokokCicilan * persentaseBunga * durasi)/12);
            double bungaKredit = pokokCicilan + bungaCicilan;
            double cicilanPerBulan = bungaKredit / durasi;
            double penghasilanPerBulan = dataConsume.getGaji_pokok() + dataConsume.getPenghasilan_tambahan();
            double limitPinjaman = penghasilanPerBulan / (dataConsume.getTanggungan()+1);
            
            if(hargaAwal <= limitPinjaman){
                credit.setCreditBasePrice(hargaAwal);
                credit.setCreditDownPayment(dataConsume.getUang_muka());
                credit.setCreditDuration(durasi);
                credit.setCreditFlag("y");
                credit.setCreditInterestRate(persentaseBunga);
                credit.setCreditStartDate(sdf.format(new Date()));
                credit.setCreditCreatedby("admin");
                credit.setCreditCreatedtime(sdf.format(new Date()));
                credit.setCreditStatus("unapproved");
                credit.setPaymentId(payment);
                
                customerDao.saveAllCredit(customer, payment, credit);
                
                kiriman.setBiayaPerBulan(cicilanPerBulan);
                kiriman.setTotal(hargaAwal);
                kiriman.setDurasi(durasi);
                kiriman.setTipe("CREDIT");
            }else if (hargaAwal>limitPinjaman) {
                kiriman.setInformasi("KREDIT TIDAK DITERIMA");
            }
            }
        }return kiriman;
    }
}
