/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.site;

import CRUD.DAO;
import PO.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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

    private String user;

    public Main() {
        user = "";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap map) {
        List<Esposizione> esp = DAO.getEsposizioniAv();
        map.put("esposizioni", esp);
        int col = 2;
        if (esp.size() % 2 == 1) {
            col = 3;
        }
        map.put("col", col);
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index2(ModelMap map) {
        List<Esposizione> esp = DAO.getEsposizioniAv();
        map.put("esposizioni", esp);
        int col = 2;
        if (esp.size() % 2 == 1) {
            col = 3;
        }
        map.put("col", col);
        return "index";
    }

    @RequestMapping(value = "/pages/contatti", method = RequestMethod.GET)
    public String contatti(ModelMap map) {
        return "pages/contatti";
    }

    @RequestMapping(value = "/pages/sign", method = RequestMethod.GET)
    public String sign(ModelMap map) {
        return "pages/sign";
    }

    @RequestMapping(value = "/pages/login", params = {"username", "password"}, method = RequestMethod.GET)
    public String login(ModelMap map, @RequestParam(value = "username") String id, @RequestParam(value = "password") String password) {
        Utente utente = DAO.getUtente(id);
        user = id;
        if (utente != null && utente.getPassword().equals(password)) {
            map.put("presente", "true");
        } else {
            map.put("presente", "false");
            map.put("user", utente);
        }
        return "pages/login";
    }

    @RequestMapping(value = "/pages/login", method = RequestMethod.GET)
    public String login(ModelMap map) {
        map.put("user", user);
        return "pages/login";
    }

    @RequestMapping(value = "/pages/orari", method = RequestMethod.GET)
    public String orari(ModelMap map) {
        List<Categoria> cat = DAO.getCategorie();
        map.put("categorie", cat);
        return "pages/orari";
    }

    @RequestMapping(value = "/pages/logout", method = RequestMethod.GET)
    public String logout(ModelMap map) {
        user = "";
        return "pages/logout";
    }

    @RequestMapping(value = "/pages/registrazione", method = RequestMethod.GET)
    public String registrazione(ModelMap map,
            @RequestParam(value = "username") String id,
            @RequestParam(value = "nome") String nome,
            @RequestParam(value = "cognome") String cognome,
            @RequestParam(value = "email") String email,
            @RequestParam(value = "dataDiNascita") String dataDiNascita,
            @RequestParam(value = "password") String password,
            @RequestParam(value = "password2") String password2) throws ParseException {
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataDiNascita);
        Utente tmp = new Utente(id, nome, cognome, email, password, date);
        int x = DAO.addUtente(tmp);
        if (x == 0) {
            map.put("tmp", "no");
            return "pages/registrazione";
        }
        map.put("tmp", "si");
        Utente u = DAO.getUtente(id);
        user = id;
        map.put("user", u);
        return "pages/registrazione";
    }

    @RequestMapping(value = "/pages/editInfo", params = {"email", "password", "confirmPassword"}, method = RequestMethod.GET)
    public String editInfo(ModelMap map, @RequestParam(value = "email") String email, @RequestParam(value = "password") String password, @RequestParam(value = "confirmPassword") String confirmPassword) {
        int x= DAO.updateUtente(user, email, password);
        if (x == 0) {
            map.put("tmp", "no");
            return "pages/editInfo";
        }
        map.put("tmp", "si");
        return "pages/editInfo";
    }

    @RequestMapping(value = "/pages/biglietto_normale", method = RequestMethod.GET)
    public String biglietto_normale(ModelMap map) {
        List<Categoria> cat = DAO.getCategorie();
        map.put("categorie", cat);
        return "pages/biglietto_normale";
    }

    @RequestMapping(value = "/pages/profile", method = RequestMethod.GET)
    public String profile(ModelMap map) {
        return "pages/profile";
    }

    @RequestMapping(value = "/pages/editProfile", method = RequestMethod.GET)
    public String editProfile(ModelMap map) {
        return "pages/editProfile";
    }

    @RequestMapping(value = "/pages/eventi", method = RequestMethod.GET)
    public String eventi(ModelMap map) {
        List<Esposizione> esp = DAO.getEsposizioniAv();
        map.put("esposizioni", esp);
        int col = 2;
        if (esp.size() % 2 == 1) {
            col = 3;
        }
        map.put("col", col);
        return "pages/eventi";
    }

    @RequestMapping(value = "/pages/my_tickets", method = RequestMethod.GET)
    public String my_tickets(ModelMap map) {
        List<Biglietto> bigl = DAO.getUserBiglietti(user);
        map.put("biglietti", bigl);
        int col = 2;
        if (bigl.size() % 2 == 1) {
            col = 3;
        }
        map.put("col", col);
        return "pages/my_tickets";
    }
}
