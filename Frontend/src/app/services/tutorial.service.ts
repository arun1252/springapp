import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

 const baseUrl = 'https://spring-boot-data-jpa-liberty-spring-boot-data-jpa-liberty-dev.clusteronedeliver-6e997a67873d748bc926b3848f2412ed-0000.us-east.containers.appdomain.cloud/tutorials';
//const baseUrl = 'http://' + window.location.hostname + ':8083/tutorials';
@Injectable({
  providedIn: 'root'
})
export class TutorialService {

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(baseUrl);
  }

  get(id): Observable<any> {
    return this.http.get(`${baseUrl}/${id}`);
  }

  create(data): Observable<any> {
    return this.http.post(baseUrl, data);
  }

  update(id, data): Observable<any> {
    return this.http.put(`${baseUrl}/${id}`, data);
  }

  delete(id): Observable<any> {
    return this.http.delete(`${baseUrl}/${id}`);
  }

  deleteAll(): Observable<any> {
    return this.http.delete(baseUrl);
  }

  findByTitle(title): Observable<any> {
    return this.http.get(`${baseUrl}?title=${title}`);
  }
}
