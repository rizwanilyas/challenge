import { WorkerService } from './../worker.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';


export interface Sector {
  name: string
  id: number
}

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponent implements OnInit {
  worker?: any;
  id: any = 0;
  isSuccessful = false;
  sectorsList: Sector[]= [];
  form: any = {
  };

  constructor(private activatedRoute: ActivatedRoute, private workerService: WorkerService) { }

  ngOnInit(): void {

    this.workerService.getSectors().subscribe(
      data => {
        this.sectorsList = data;
      },
      err => {
        alert("Error");
      }
    );

    this.activatedRoute.paramMap.subscribe((data) => {
      this.id = data.get("id");
      this.workerService.getWorkerById(this.id).subscribe(
        data => {
          this.form = data;
          this.form.sectors = this.form.sectors.map(o => o.sector.id);
          console.log(this.form.sectors);
        },
        err => {
          this.form = JSON.parse(err.error).message;
        }
      );
    })

  }

  onSubmit(): void {
    this.workerService.updateWorker(this.form, this.id).subscribe(
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
