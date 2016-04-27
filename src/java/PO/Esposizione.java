package PO;
// Generated 23-apr-2016 1.33.43 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 * Esposizioni generated by hbm2java
 */
@Entity
@Table(name="ESPOSIZIONI")
public class Esposizione  implements java.io.Serializable {

     @Id
     @GeneratedValue
     private String titolo;
     @Temporal(javax.persistence.TemporalType.DATE)
     private Date dataDiInizio;
     @Temporal(javax.persistence.TemporalType.DATE)
     private Date dataDiFine;
     
    @OneToMany(mappedBy="titoloEsposizione")
    private Set<Biglietto> biglietti;

    public Esposizione() {
    }

    public Esposizione(String titolo, Date dataDiInizio, Date dataDiFine) {
       this.titolo = titolo;
       this.dataDiInizio = dataDiInizio;
       this.dataDiFine = dataDiFine;
    }

    public Esposizione(String titolo, Date dataDiInizio, Date dataDiFine, Set<Biglietto> biglietti) {
        this.titolo = titolo;
        this.dataDiInizio = dataDiInizio;
        this.dataDiFine = dataDiFine;
        this.biglietti = biglietti;
    }
    
   
    public String getTitolo() {
        return this.titolo;
    }
    
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }
    public Date getDataDiInizio() {
        return this.dataDiInizio;
    }
    
    public void setDataDiInizio(Date dataDiInizio) {
        this.dataDiInizio = dataDiInizio;
    }
    public Date getDataDiFine() {
        return this.dataDiFine;
    }
    
    public void setDataDiFine(Date dataDiFine) {
        this.dataDiFine = dataDiFine;
    }

    public Set<Biglietto> getBiglietti() {
        return biglietti;
    }

    public void setBiglietti(Set<Biglietto> biglietti) {
        this.biglietti = biglietti;
    }



}


