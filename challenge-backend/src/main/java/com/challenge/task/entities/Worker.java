package com.challenge.task.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "worker")
public class Worker {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "name", nullable = false)
  private String name;


  @Column(name = "agree_to_terms", nullable = false)
  private Boolean agreeToTerms;

  @OneToMany(mappedBy = "worker", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JsonIgnoreProperties(
      value = {"worker"},
      allowSetters = true)
  private Set<WorkerSector> sectors;

  public Worker() {
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Boolean getAgreeToTerms() {
    return agreeToTerms;
  }

  public void setAgreeToTerms(Boolean agreeToTerms) {
    this.agreeToTerms = agreeToTerms;
  }

  public Set<WorkerSector> getSectors() {
    return sectors;
  }

  public void setSectors(Set<WorkerSector> sectors) {
    this.sectors = sectors;
  }
}
