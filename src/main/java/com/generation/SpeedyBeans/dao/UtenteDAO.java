package com.generation.SpeedyBeans.dao;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.generation.SpeedyBeans.database.Database;
import com.generation.SpeedyBeans.entities.Entity;
import com.generation.SpeedyBeans.entities.Utente;

@Service
public class UtenteDAO implements IDAO<Utente> {

    @Autowired
    private Database database;

    @Autowired
    private ApplicationContext context;

    private final String insertPersona = "insert into persone (nome, cognome, username, password) values (?, ?, ?, ?)";
    private final String insertUtente = "insert into utenti (id_persona, ragione_sociale, partita_iva, codice_sdi, indirizzo, cap, citta, provincia, nazione, telefono, email) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private final String readAllUtenti = "select u.id_persona as id, u.ragione_sociale, u.partita_iva, u.codice_sdi, u.indirizzo, u.cap, u.citta, u.provincia, u.nazione, u.telefono, u.email, p.nome, p.cognome, p.username, p.password from utenti u join persone p on u.id_persona = p.id_persona";

    private final String readUtenteById = "select u.id_persona as id, u.ragione_sociale, u.partita_iva, u.codice_sdi, u.indirizzo, u.cap, u.citta, u.provincia, u.nazione, u.telefono, u.email, p.nome, p.cognome, p.username, p.password from utenti u join persone p on u.id_persona = p.id_persona where u.id_persona = ?";

    private final String updatePersona = "update persone set nome = ?, cognome = ?, username = ?, password = ? where id_persona = ?";
    private final String updateUtente = "update utenti set ragione_sociale = ?, partita_iva = ?, codice_sdi = ?, indirizzo = ?, cap = ?, citta = ?, provincia = ?, nazione = ?, telefono = ?, email = ? where id_persona = ?";
    private final String deletePersona = "delete from persone where id_persona = ?";

    private final String findByPartitaIvaLike = "select u.*, p.* from utenti u join persone p on u.id_persona = p.id_persona where u.partita_iva like(concat('%', ?, '%'))";

    private final String findByCognomeLike = "select u.*, p.* from utenti u join persone p on u.id_persona = p.id_persona where p.cognome like(concat('%', ?, '%'))";

    private final String findByFilters = "select u.*, p.* from utenti u join persone p on u.id_persona = p.id_persona where u.partita_iva like(concat('%', ?, '%')) AND p.cognome like(concat('%', ?, '%'))";

    private final String findByUsername = "select u.*, p.* from utenti u join persone p on u.id_persona = p.id_persona where p.username = ?";

    private final String findByQuery = "SELECT u.id_persona as id, u.ragione_sociale, u.partita_iva, u.codice_sdi, u.indirizzo, u.cap, u.citta, u.provincia, u.nazione, u.telefono, u.email, p.nome, p.cognome, p.username, p.password FROM utenti u JOIN persone p ON u.id_persona = p.id_persona WHERE p.nome LIKE CONCAT('%', ?, '%') OR p.cognome LIKE CONCAT('%', ?, '%') OR u.partita_iva LIKE CONCAT('%', ?, '%')";

    @Override
    public int create(Utente s) {
       
        int id = database.executeUpdate(insertPersona, s.getNome(), s.getCognome(), s.getUsername(), s.getPassword());

        database.executeUpdate(insertUtente, String.valueOf(id), s.getRagioneSociale(), s.getPartitaIva(), s.getCodiceSdi(), s.getIndirizzo(), String.valueOf(s.getCap()), s.getCitta(), s.getProvincia(), s.getNazione(), String.valueOf(s.getTelefono()), s.getEmail());

        return id;
    }

    @Override
    public Map<Integer, Entity> readAll() {
        Map<Integer, Entity> ris = new LinkedHashMap<>();

        Map<Integer, Map<String, String>> result = database.executeQuery(readAllUtenti);

        for(Entry<Integer, Map<String, String>> coppia : result.entrySet()) {
            Utente u = context.getBean(Utente.class, coppia.getValue());
            ris.put(u.getId(), u);
            
        }
    return ris;
    }

    public Utente readById(int id) {
        Utente ris = null;
        Map<Integer, Map<String, String>> result = database.executeQuery(readUtenteById, String.valueOf(id));

        for (Entry<Integer, Map<String, String>> coppia : result.entrySet()) {
            ris = context.getBean(Utente.class, coppia.getValue());
        }

        return ris;
    }

  
    @Override
    public void update(Utente e) {
        database.executeUpdate(updatePersona, e.getNome(), e.getCognome(), e.getUsername(), e.getPassword(), String.valueOf(e.getId()));

        database.executeUpdate(updateUtente, e.getRagioneSociale(), e.getPartitaIva(), e.getCodiceSdi(), e.getIndirizzo(), String.valueOf(e.getCap()), e.getCitta(), e.getProvincia(), e.getNazione(), String.valueOf(e.getTelefono()), e.getEmail(), String.valueOf(e.getId()));
    }

    @Override
    public void delete(int id) {
        database.executeUpdate(deletePersona, String.valueOf(id));
    }

    public Map<Integer, Entity> findByFilters(String partitaIva, String cognome) {
        Map<Integer, Entity> ris = new LinkedHashMap<>();
        Map<Integer, Map<String, String>> result = null;

        if(cognome == null) {
            result = database.executeQuery(findByPartitaIvaLike, partitaIva);
        } else if (partitaIva == null) {
            result = database.executeQuery(findByCognomeLike, cognome); 
        }else {
            result = database.executeQuery(findByFilters, partitaIva, cognome);
        }

        for(Entry<Integer, Map<String, String>> coppia : result.entrySet()) {
            Utente u = context.getBean(Utente.class, coppia.getValue());
            ris.put(u.getId(), u);
        }

        return ris;

    }


    public Utente readByUsername(String username) {
        Utente ris = null;
        Map<Integer, Map<String, String>> result = database.executeQuery(findByUsername, username);

        for (Entry<Integer, Map<String, String>> coppia : result.entrySet()) {
            ris = context.getBean(Utente.class, coppia.getValue());

        }

        return ris;
    
    }

    public List<Utente> findByQuery(String query) {
        
        List<Utente> ris = new ArrayList<>();
        Map<Integer, Map<String, String>> result = database.executeQuery(findByQuery, query, query, query);
    
        for (Entry<Integer, Map<String, String>> coppia : result.entrySet()) {
            Utente u = context.getBean(Utente.class, coppia.getValue());
            ris.add(u);
        }
    
        return ris;
    }

    
}