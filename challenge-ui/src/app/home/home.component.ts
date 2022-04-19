import { Component, OnInit } from '@angular/core';
import { WorkerService } from './../worker.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  workers:any;

  constructor(private workerService: WorkerService) {
  }

  ngOnInit(): void {

    this.workerService.getWorkers().subscribe(
      data => {
        this.workers= data;        
      },
      err => {
        alert("Error");
      }
    );
  }

}
