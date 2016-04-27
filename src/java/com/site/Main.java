/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.site;

import CRUD.DAO;
import PO.*;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author chnedev
 */
@Controller
public class Main {
    
    @RequestMapping(value="/", method= RequestMethod.GET)
    public String index(ModelMap map){
        List<Esposizione> esp= DAO.getEsposizioniAv();
        map.put("esposizioni", esp);
        int col=2;
        if(esp.size()%2==1) col=3;
        map.put("col", col);
        return "index";
    }
    
    @RequestMapping(value="/index", method= RequestMethod.GET)
    public String index2(ModelMap map){
        return "index";
    }
    
    @RequestMapping(value="/pages/contatti", method= RequestMethod.GET)
    public String contatti(ModelMap map){
        return "pages/contatti";
    }
    
    @RequestMapping(value="/pages/sign", method= RequestMethod.GET)
    public String sign(ModelMap map){
        return "pages/sign";
    }
    
    @RequestMapping(value="/pages/login",params = {"username","password"}, method = RequestMethod.GET)
    public String login(ModelMap map,@RequestParam(value="username") String id, @RequestParam(value="password") String password){
        Utente utente=DAO.getUtente(id);
        if(utente==null) map.put("presente", "false");
        else{
            map.put("presente", "true");
            map.put("user", utente);
        }
        return "pages/login";
    }
    
    @RequestMapping(value="/pages/logout", method= RequestMethod.GET)
    public String logout(ModelMap map){
        return "pages/logout";
    }
}
