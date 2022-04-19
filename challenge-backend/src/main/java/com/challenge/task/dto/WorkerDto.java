package com.challenge.task.dto;

import java.util.List;

public class WorkerDto {

  private String name;
  private Boolean agreeToTerms;

  private List<Long> sectors;

  public WorkerDto() {
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

  public List<Long> getSectors() {
    return sectors;
  }

  public void setSectors(List<Long> sectors) {
    this.sectors = sectors;
  }
}
