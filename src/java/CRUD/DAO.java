/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD;

import PO.*;
import Util.HibernateUtil;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author chnedev
 */
public class DAO {

    // Interazione con la tabella Biglietti
    public static List<Biglietto> getBiglietti() {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Biglietto";
        Query query = session.createQuery(hql);
        List<Biglietto> lista = query.list();
        return lista;

    }

    public static Biglietto getBiglietto(String codice) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Biglietto WHERE Codice= :codice";
        Query query = session.createQuery(hql);
        query.setParameter("codice", codice);
        Biglietto biglietto = (Biglietto) query.uniqueResult();
        return biglietto;
    }

    public static int addBiglietto(String codice, BigDecimal tariffa, Utente idVisitatore) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "INSERT INTO Biglietto(Codice,Tariffa,IdVisitatore) VALUES(:codice, :tariffa, :visitatore)";
            Query query = session.createQuery(hql);
            query.setParameter("codice", codice);
            query.setParameter("tariffa", tariffa);
            query.setParameter("visitatore", idVisitatore.getId());
            int x = query.executeUpdate();
            tx.commit();
            return x;
        } catch (Exception ex) {
            tx.rollback();
        }
        sessionFactory.close();
        return 0;
    }

    public static int addBiglietto(String codice, BigDecimal tariffa, Utente idVisitatore, Categoria codiceCategoria) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "INSERT INTO Biglietto(Codice,Tariffa,IdVisitatore,CodiceCategoria) VALUES(:codice, :tariffa, :visitatore, :codiceCategoria)";
            Query query = session.createQuery(hql);
            query.setParameter("codice", codice);
            query.setParameter("tariffa", tariffa);
            query.setParameter("visitatore", idVisitatore.getId());
            query.setParameter("codiceCategoria", codiceCategoria.getCodice());
            int x = query.executeUpdate();
            tx.commit();
            return x;
        } catch (Exception ex) {
            tx.rollback();
        }
        sessionFactory.close();
        return 0;
    }

    public static int addBiglietto(String codice, BigDecimal tariffa, Date dataDiValidita, Esposizione titoloEsposizione, Utente idVisitatore) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "INSERT INTO Biglietto(Codice,Tariffa,DataDiValidita,TitoloEsposizione,IdVisitatore) VALUES(:codice, :dataDiValidita,:esposizione,:tariffa, :visitatore)";
            Query query = session.createQuery(hql);
            query.setParameter("codice", codice);
            query.setParameter("tariffa", tariffa);
            query.setParameter("dataDiValidita", dataDiValidita);
            query.setParameter("esposizione", titoloEsposizione.getTitolo());
            query.setParameter("visitatore", idVisitatore.getId());
            int x = query.executeUpdate();
            tx.commit();
            return x;
        } catch (Exception ex) {
            tx.rollback();
        }
        sessionFactory.close();
        return 0;
    }

    public static int addBiglietto(String codice, BigDecimal tariffa, Date dataDiValidita, Esposizione titoloEsposizione, Utente idVisitatore, Categoria codiceCategoria) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "INSERT INTO Biglietto(Codice,Tariffa,DataDiValidita,TitoloEsposizione,IdVisitatore,CodiceCategoria) VALUES(:codice, :dataDiValidita,:esposizione,:tariffa, :visitatore, :categoria)";
            Query query = session.createQuery(hql);
            query.setParameter("codice", codice);
            query.setParameter("tariffa", tariffa);
            query.setParameter("dataDiValidita", dataDiValidita);
            query.setParameter("esposizione", titoloEsposizione);
            query.setParameter("visitatore", idVisitatore.getId());
            query.setParameter("categoria", codiceCategoria.getCodice());
            int x = query.executeUpdate();
            tx.commit();
            return x;
        } catch (Exception ex) {
            tx.rollback();
        }
        sessionFactory.close();
        return 0;
    }

    public static List<Biglietto> getUserBiglietti(String id) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Biglietto GROUP BY IdVisitatore :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        List<Biglietto> lista = query.list();
        return lista;

    }

    // Interazione con la tabella Utenti
    public static Utente getUtente(String id) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Utente WHERE Id= :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        List<Utente> utenti = query.list();
        if (utenti.isEmpty()) {
            return null;
        }
        return utenti.get(0);
    }

    public static int addUtente(String id, String nome, String cognome, String email, String password, Date dataDiNascita) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Utente tmp = new Utente(id, nome, cognome, email, password, dataDiNascita);
            Integer x = (Integer) session.save(tmp);;
            tx.commit();
            return x;
        } catch (Exception ex) {
            tx.rollback();
        }
        sessionFactory.close();
        return 0;
    }

    public static int updateUtente(String id, String nome, String cognome, String email, String password, Date dataDiNascita) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "UPDATE Utente SET Id= :id, Nome= :nome, Cognome= :cognome, Email= :email, Password= :password, DataDiNascita= :dataDiNascita WHERE Id= :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            query.setParameter("nome", nome);
            query.setParameter("cognome", cognome);
            query.setParameter("email", email);
            query.setParameter("password", password);
            query.setParameter("dataDiNascita", dataDiNascita);
            return query.executeUpdate();
        } catch (Exception ex) {
            tx.rollback();
        }
        sessionFactory.close();
        return 0;
    }

    public static int deleteUtente(String id) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "DELETE FROM Utente WHERE Id= :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            return query.executeUpdate();
        } catch (Exception ex) {
            tx.rollback();
        }
        sessionFactory.close();
        return 0;
    }

    // Interazione con la tabella Esposizioni
    public static List<Esposizione> getEsposizioni() {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Esposizione";
        Query query = session.createQuery(hql);
        List<Esposizione> lista = query.list();
        return lista;
    }

    public static List<Esposizione> getEsposizioniAv() {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Esposizione WHERE DataDiInizio< :dataoggi AND DataDiFine> :dataoggi OR DataDiInizio>= :dataoggi ORDER BY DataDiInizio";
        Query query = session.createQuery(hql);
        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        query.setParameter("dataoggi", ft.format(dNow));
        List<Esposizione> lista = query.list();
        return lista;
    }

    // Interazione con la tabella Categorie
    public static List<Categoria> getCategorie() {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Categoria";
        Query query = session.createQuery(hql);
        List<Categoria> lista = query.list();
        return lista;
    }

}
