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
        Biglietto bigl=new Biglietto(codice,tariffa,idVisitatore);
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try{
        session.save(bigl);
        session.getTransaction().commit();
        session.close();
        return 1;
        }catch(Exception e){return 0;}
    }

    public static int addBiglietto(String codice, BigDecimal tariffa, Utente idVisitatore, Categoria codiceCategoria) {
        Biglietto bigl=new Biglietto(codice,tariffa,idVisitatore,codiceCategoria);
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try{
        session.save(bigl);
        session.getTransaction().commit();
        session.close();
        return 1;
        }catch(Exception e){return 0;}
    }

    public static int addBiglietto(String codice, BigDecimal tariffa, Date dataDiValidita, Esposizione titoloEsposizione, Utente idVisitatore) {
        Biglietto bigl=new Biglietto(codice,tariffa,dataDiValidita,titoloEsposizione, idVisitatore);
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try{
        session.save(bigl);
        session.getTransaction().commit();
        session.close();
        return 1;
        }catch(Exception e){return 0;}
    }

    public static int addBiglietto(String codice, BigDecimal tariffa, Date dataDiValidita, Esposizione titoloEsposizione, Utente idVisitatore, Categoria codiceCategoria) {
        Biglietto bigl=new Biglietto(codice,tariffa,dataDiValidita,titoloEsposizione, idVisitatore,codiceCategoria);
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try{
        session.save(bigl);
        session.getTransaction().commit();
        session.close();
        return 1;
        }catch(Exception e){return 0;}
    }

    public static List<Biglietto> getUserBiglietti(String id) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Utente user = DAO.getUtente(id);
        String hql = "FROM Biglietto WHERE IdVisitatore :user";
        Query query = session.createQuery(hql);
        query.setParameter("user", user);
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

    public static int addUtente(Utente tmp) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try{
        session.save(tmp);
        session.getTransaction().commit();
        session.close();
        return 1;
        }catch(Exception e){return 0;}
    }

    public static int updateUtente(String id, String email, String password) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            String hql1 = "UPDATE Utente SET Email= :email WHERE Id= :id";
            Query query1 = session.createQuery(hql1);
            String hql2 = "UPDATE Utente SET Password= :password WHERE Id= :id";
            Query query2 = session.createQuery(hql2);
            query1.setParameter("id", id);
            query2.setParameter("id", id);
            query1.setParameter("email", email);
            query2.setParameter("password", password);
            int x= query1.executeUpdate();
            int y= query2.executeUpdate();
            session.getTransaction().commit();
            session.close();
            if((x+y)==1)return 1;
            else return 0;
        } catch (Exception e) {
            return 0;
        }
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
