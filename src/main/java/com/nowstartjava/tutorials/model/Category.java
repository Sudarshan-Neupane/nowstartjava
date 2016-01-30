package com.nowstartjava.tutorials.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity @JsonIgnoreProperties({"tutorials"})
@Table(name = "category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotNull(message = "name should not be null")
	private String name;
	// one to many for tutorials
	@OneToMany(fetch = FetchType.LAZY, mappedBy="category",cascade=CascadeType.REMOVE)
	private List<Tutorials> tutorials;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Tutorials> getTutorials() {
		return tutorials;
	}

	public void setTutorials(List<Tutorials> tutorials) {
		this.tutorials = tutorials;
	}
}
