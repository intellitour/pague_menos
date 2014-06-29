package br.iesb.pm.persistencia.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="teste")
@SequenceGenerator(name="TesteVO.seq", sequenceName="teste_sequence", initialValue=1, allocationSize=1)
public class TesteVO implements Serializable {
	private static final long serialVersionUID = 4196139098551073380L;
	
	@Id
	@Column(name="nu_teste")
	@GeneratedValue(generator="TesteVO.seq", strategy=GenerationType.SEQUENCE)
	private Integer nuTeste;
	@Column(name="no_teste", length=20, nullable=false)
	private String noTeste;
	
	public Integer getNuTeste() {
		return nuTeste;
	}
	public void setNuTeste(Integer nuTeste) {
		this.nuTeste = nuTeste;
	}
	public String getNoTeste() {
		return noTeste;
	}
	public void setNoTeste(String noTeste) {
		this.noTeste = noTeste;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nuTeste == null) ? 0 : nuTeste.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TesteVO other = (TesteVO) obj;
		if (nuTeste == null) {
			if (other.nuTeste != null)
				return false;
		} else if (!nuTeste.equals(other.nuTeste))
			return false;
		return true;
	}
	
}
