package com.challenge.task.service;

import com.challenge.task.dto.WorkerDto;
import com.challenge.task.entities.Sector;
import com.challenge.task.entities.Worker;
import com.challenge.task.entities.WorkerSector;
import com.challenge.task.repo.SectorRepository;
import com.challenge.task.repo.WorkerRepository;
import com.challenge.task.repo.WorkerSectorRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WorkerService {

  @Autowired
  SectorRepository sectorRepository;
  @Autowired
  WorkerRepository workerRepository;
  @Autowired
  WorkerSectorRepository workerSectorRepository;

  @Transactional(readOnly = true)
  public List<Sector> listSectors() {
    return sectorRepository.findAll();
  }

  @Transactional(readOnly = true)
  public List<Worker> listWorkers() {
    return workerRepository.findAll();
  }

  public Worker getWorkerById(Long id) {
    return workerRepository
        .findById(id)
        .orElseThrow(() -> new RuntimeException("Worker with give id does not exist"));
  }

  public void deleteWorker(Long id) {
    Worker worker = workerRepository
        .findById(id)
        .orElseThrow(() -> new RuntimeException("Worker with give id does not exist"));
    workerRepository.delete(worker);
  }

  @Transactional
  public Worker save(WorkerDto createWorkerDto) {

    List<Long> sectorIds = createWorkerDto.getSectors();
    if(sectorIds == null || sectorIds.isEmpty())
        throw new RuntimeException("At least one Sectors required");


    Worker worker = new Worker();
    worker.setName(createWorkerDto.getName());
    worker.setAgreeToTerms(createWorkerDto.getAgreeToTerms());

    workerRepository.save(worker);

    // save sectors
    List<Sector> sectors = sectorRepository.findAllByIdIn(sectorIds);
    sectors.stream()
        .map(sector -> new WorkerSector(worker, sector))
        .forEach(workerSectorRepository::save);
    return worker;
  }

  public Worker update(WorkerDto workerDto, Long id) {
    Worker worker = getWorkerById(id);

    List<Long> sectorIds = workerDto.getSectors();
    if(sectorIds == null || sectorIds.isEmpty())
      throw new RuntimeException("At least one Sectors required");

    worker.setName(workerDto.getName());
    worker.setAgreeToTerms(workerDto.getAgreeToTerms());

    //delete old sectors
    workerSectorRepository.deleteAllByWorker(worker.getId());

    List<Sector> sectors = sectorRepository.findAllByIdIn(sectorIds);
    sectors.stream()
        .map(sector -> new WorkerSector(worker, sector))
        .forEach(workerSectorRepository::save);

    return getWorkerById(id);
  }
}
