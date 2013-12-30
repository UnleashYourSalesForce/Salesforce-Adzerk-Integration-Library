/**
 * Copyright (c) 2013, VersatileCapitalist Software, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the VersatileCapitalist Software, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/ 

global with sharing class AdzerkGeoTargetingService {
    public Integer LocationId=0;
    public Integer FlightId=0;
    public String CountryCode;
    public String Region;
    public Integer MetroCode;
    public Boolean IsExclude=true;
     public AdzerkGeoTargetingService(){}
     public AdzerkGeoTargetingService(JSONParser parser) {
        while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'LocationId'){
                                            LocationId=Integer.Valueof(parser.getText());
                                            } else if (text == 'FlightId') {
                                             FlightId= Integer.Valueof(parser.getText());
                                             } else if (text == 'CountryCode') {
                                                CountryCode=parser.getText();
                                             }else if (text == 'Region') {
                                                Region=parser.getText();
                                             }else if (text == 'MetroCode') {
                                                MetroCode=Integer.Valueof(parser.getText());
                                             }else if (text == 'IsExclude') {
                                                IsExclude=Boolean.Valueof(parser.getText());
                                             }
                                         }
                                   }
                            }
    }
    //Get Geo Targeting Data FlightId on Geo Targeting id from Adzerk          
     webService static AdzerkGeoTargetingService GetGeoTargetingByFlightId(String accessApikey, Integer FlightId,Integer id) {  
                String Apiendpoint= 'http://api.adzerk.net/v1/flight/'+FlightId+'/geotargeting/'+id; 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);                  
                return new AdzerkGeoTargetingService(System.JSON.createParser(res.getbody()));
     }
     //Delete GeoTargetingService based on id from Adzerk          
     webService static string DeleteGeoTargeting(String accessApikey,Integer FlightId,Integer id) {   
                String Apiendpoint= 'http://api.adzerk.net/v1/flight/'+FlightId+'/geotargeting/'+id+'/delete';
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                string response = res.getBody();
                return response; 
     }
       
      //Create GeoTargetingService on Adzerk    
      webService static AdzerkGeoTargetingService CreateGeoTargeting(String accessApikey,Integer FlightId,AdzerkGeoTargetingService geotargeting) {
                String Apiendpoint= 'http://api.adzerk.net/v1/flight/'+FlightId+'/geotargeting';
                string jsonContent= Json.Serialize(geotargeting);                             
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('POST');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('geotargeting='+jsonContent);
                req.setEndpoint(Apiendpoint);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkGeoTargetingService(System.JSON.createParser(res.getbody()));
      }
     //Update GeoTargetingService on Adzerk    
     webService static AdzerkGeoTargetingService  UpdateGeoTargeting(String accessApikey,Integer id,Integer FlightId,AdzerkGeoTargetingService geotargeting) {
                String Apiendpoint= 'http://api.adzerk.net/v1/flight/'+FlightId+'/geotargeting';
                string jsonContent= Json.Serialize(geotargeting);                               
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('PUT');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('geotargeting='+jsonContent);               
                req.setEndpoint(Apiendpoint+'/'+id);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkGeoTargetingService(System.JSON.createParser(res.getbody()));
     } 
   
}