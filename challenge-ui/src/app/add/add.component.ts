import { Component, OnInit } from '@angular/core';
import { WorkerService } from './../worker.service';


export interface Sector {
  name: string
  id: number
}

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponent implements OnInit {
  sectorsList: Sector[]= [];
  form: any = {
      name: null,
      sectors: null,
      agreeToTerms: null
    };  
    isSuccessful = false;

  constructor(private workerService: WorkerService) {
  }

  ngOnInit(): void {
    this.workerService.getSectors().subscribe(
      data => {
        this.sectorsList = data;
      },
      err => {
        alert("Error");
      }
    );
  }

  onSubmit(): void {
    console.log(this.form);
    this.workerService.saveWorker(this.form).subscribe(
      data => {
        let orderId = data['id'];
        this.isSuccessful = true;
      },
      err => {
        alert(err);
      }
    );
  }

}
