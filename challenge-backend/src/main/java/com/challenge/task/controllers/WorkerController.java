package com.challenge.task.controllers;

import com.challenge.task.dto.WorkerDto;
import com.challenge.task.entities.Sector;
import com.challenge.task.entities.Worker;
import com.challenge.task.service.WorkerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class WorkerController {

  @Autowired WorkerService workerService;

  @PostMapping("/worker")
  public ResponseEntity<?> create(@RequestBody WorkerDto workerDto) {
    return ResponseEntity.ok(workerService.save(workerDto));
  }

  @GetMapping("/worker")
  public ResponseEntity<List<Worker>> listWorkers() {
    List<Worker> workers = workerService.listWorkers();
    return ResponseEntity.ok().body(workers);
  }

  @GetMapping("/sector")
  public ResponseEntity<List<Sector>> list() {
    List<Sector> sectors = workerService.listSectors();
    return ResponseEntity.ok().body(sectors);
  }

  @GetMapping("/worker/{id}")
  public ResponseEntity<Worker> get(@PathVariable("id") Long id) {
    return ResponseEntity.ok(workerService.getWorkerById(id));
  }

  @PutMapping("/worker/{id}")
  public ResponseEntity<Worker> update(
      @PathVariable("id") Long id, @RequestBody WorkerDto workerDto) {
    return ResponseEntity.ok(workerService.update(workerDto, id));
  }
}
