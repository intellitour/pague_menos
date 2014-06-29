package br.iesb.pm.persistencia.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.HibernateException;

@Stateless
@LocalBean
public class GenericDAO {

	@PersistenceContext
	private EntityManager em;
	
	
	public Object doFindByKey(Class<? extends Serializable> tipo, Serializable key) throws PersistenceException {
		try {
			return em.find(tipo, key);
		}catch (PersistenceException | HibernateException e) {
			throw new PersistenceException(e);
		}
	}
	
	
	public List<?> recuperarTodos(Class<? extends Serializable> tipo, String ordenacao) throws PersistenceException {
		try {
			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<?> query = cb.createQuery(tipo);
			
			Root<?> root = query.from(tipo);
			if (ordenacao != null && ordenacao.length() > 0) {
				query.orderBy(cb.asc(root.get(ordenacao)));
			}
			return em.createQuery(query).getResultList();
		}catch (PersistenceException | HibernateException e) {
			throw new PersistenceException(e);
		}
	}
	
	
	public Object namedQueryResultadoUnico(String nome, Map<String, Object> parametros) throws PersistenceException {
		try {
			Object retorno = null;
			Query query = em.createNamedQuery(nome);
			if (parametros != null && parametros.size() > 0) {
				for (String key : parametros.keySet()) {
					query.setParameter(key, parametros.get(key));
				}
				retorno = query.getSingleResult();
			}else {
				retorno = query.getSingleResult();
			}
			return retorno;
		}catch(NoResultException e) {
			return null;
		}catch (Exception e) {
			throw new PersistenceException(e);
		}
	}
	
	
	public List<?> namedQueryListaResultados(String nome, Map<String, Object> parametros) throws PersistenceException {
		try {
			List<?> retorno = null;
			Query query = em.createNamedQuery(nome);
			if (parametros != null && parametros.size() > 0) {
				for (String key : parametros.keySet()) {
					query.setParameter(key, parametros.get(key));
				}
				retorno = query.getResultList();
			}else {
				retorno = query.getResultList();
			}
			return retorno;
		}catch (Exception e) {
			throw new PersistenceException(e);
		}
	}
	
	
	public List<?> namedQueryListaResultados(String nome, Map<String, Object> parametros, int limit) throws PersistenceException {
		try {
			List<?> retorno = null;
			Query query = em.createNamedQuery(nome);
			query.setMaxResults(limit);
			if (parametros != null && parametros.size() > 0) {
				for (String key : parametros.keySet()) {
					query.setParameter(key, parametros.get(key));
				}
				retorno = query.getResultList();
			}else {
				retorno = query.getResultList();
			}
			return retorno;
		}catch (Exception e) {
			throw new PersistenceException(e);
		}
	}
	
	@TransactionAttribute(TransactionAttributeType.MANDATORY)
	public void doInsert(Serializable vo) throws PersistenceException {
		try {
			em.persist(vo);
		}catch (PersistenceException | HibernateException e) {
			throw new PersistenceException(e);
		}
	}
	
	@TransactionAttribute(TransactionAttributeType.MANDATORY)
	public Serializable doUpdate(Serializable vo) throws PersistenceException {
		try {
			return em.merge(vo);
		}catch (PersistenceException | HibernateException e) {
			throw new PersistenceException(e);
		}
	}
	
	@TransactionAttribute(TransactionAttributeType.MANDATORY)
	public void doDelete(Serializable vo) throws PersistenceException {
		try {
			em.remove(vo);
		}catch (PersistenceException | HibernateException e) {
			throw new PersistenceException(e);
		}
	}
	
	@TransactionAttribute(TransactionAttributeType.MANDATORY)
	public void salvarVarios(Collection<? extends Serializable> lista) throws PersistenceException {
		try {
			for (Serializable vo: lista) {
				em.persist(vo);
			}
		}catch (PersistenceException | HibernateException e) {
			throw new PersistenceException(e);
		}
	}
	
	@TransactionAttribute(TransactionAttributeType.MANDATORY)
	public void deletarVarios(Collection<? extends Serializable> lista) throws PersistenceException {
		try {
			for (Serializable vo: lista) {
				em.remove(vo);
			}
		}catch (PersistenceException | HibernateException e) {
			throw new PersistenceException(e);
		}
	}
}
