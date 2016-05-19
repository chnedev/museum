/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PO;

import java.util.List;

/**
 *
 * @author chnedev
 */
public class JsonObj {
    private String codice;
    private String categoria;
    private List<String> servizi;

    @Override
    public String toString() {
        return "JsonObj{" + "codice=" + codice + ", categoria=" + categoria + ", servizi=" + servizi.toString() + '}';
    }

    public List<String> getServizi() {
        return servizi;
    }

    public void setServizi(List<String> servizi) {
        this.servizi = servizi;
    }

    public String getCodice() {
        return codice;
    }

    public void setCodice(String codice) {
        this.codice = codice;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    
    
}
