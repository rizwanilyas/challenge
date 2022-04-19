import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class WorkerService {
  WORKER_URL: string;
  SECTOR_URL: string;

  constructor(private http: HttpClient) {
    this.WORKER_URL = environment.baseURL + "api/worker";
    this.SECTOR_URL = environment.baseURL + "api/sector";
  }

  getSectors(): Observable<any> {
    return this.http.get(this.SECTOR_URL);
  }

  getWorkers(): Observable<any> {
    return this.http.get(this.WORKER_URL);
  }

  saveWorker(worker:any): Observable<any> {
    return this.http.post(this.WORKER_URL, worker);
  }

  updateWorker(worker:any, id:number): Observable<any> {
    return this.http.put(this.WORKER_URL+'/'+id, worker);
  }

  getWorkerById(id: number): Observable<any> {
    return this.http.get(this.WORKER_URL+'/'+id);
  }
}
