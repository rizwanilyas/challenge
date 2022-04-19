package com.challenge.task.repo;

import com.challenge.task.entities.WorkerSector;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkerSectorRepository extends JpaRepository<WorkerSector, Long> {

  @Modifying
  @Query(value = "DELETE FROM WorkerSector e WHERE e.worker.id = :workerId")
  void deleteAllByWorker(Long workerId);
}
