package PO;
// Generated 23-apr-2016 1.33.43 by Hibernate Tools 4.3.1


import static java.lang.reflect.Array.set;
import java.util.Date;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Utenti generated by hbm2java
 */

@Entity
@Table(name="UTENTI")
public class Utente  implements java.io.Serializable {

     @Id
     @GeneratedValue
     private String id;
     private String nome;
     private String cognome;
     private String email;
     private String password;
     private Date dataDiNascita;
     
    @OneToMany(mappedBy="idVisitatore")
    private Set<Biglietto>biglietti;

    public Utente() {
    }

    public Utente(String id, String nome, String cognome, String email, String password, Date dataDiNascita) {
       this.id = id;
       this.nome = nome;
       this.cognome = cognome;
       this.email = email;
       this.password = password;
       this.dataDiNascita = dataDiNascita;
    }

    public Utente(String id, String nome, String cognome, String email, String password, Date dataDiNascita, Set<Biglietto> biglietti) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.password = password;
        this.dataDiNascita = dataDiNascita;
        this.biglietti = biglietti;
    }
    
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getCognome() {
        return this.cognome;
    }
    
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getDataDiNascita() {
        return this.dataDiNascita;
    }
    
    public void setDataDiNascita(Date dataDiNascita) {
        this.dataDiNascita = dataDiNascita;
    }

    public Set<Biglietto> getBiglietti() {
        return biglietti;
    }

    public void setBiglietti(Set<Biglietto> biglietti) {
        this.biglietti = biglietti;
    }
    




}


