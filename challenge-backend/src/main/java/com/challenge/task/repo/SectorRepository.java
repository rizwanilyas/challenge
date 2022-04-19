package com.challenge.task.repo;

import com.challenge.task.entities.Sector;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SectorRepository extends JpaRepository<Sector, Long> {
  List<Sector> findAllByIdIn(List<Long> ids);
}
