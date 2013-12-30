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

global with sharing class AdzerkAdvertiserService {
    global class Items {
    public Integer Id=0;
    public String Title;
    public Boolean IsDeleted=false;
    public Boolean IsActive=true;
    
    public Items (){}
    public Items (JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Id'){
                                            Id=Integer.valueof(parser.getText());
                                            }else if (text == 'Title'){
                                            Title=parser.getText();
                                            } else if (text == 'IsDeleted') {
                                             IsDeleted=Boolean.Valueof(parser.getText());
                                             } else if (text == 'IsActive') {
                                                IsActive=Boolean.Valueof(parser.getText());
                                                }
                                         }
                                   }
                            }
               }
    }
    
    public Integer TotalPages;
    public List<Items> Items;
    
    public AdzerkAdvertiserService (){}
    public AdzerkAdvertiserService (JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'TotalPages'){
                                            TotalPages=Integer.Valueof(parser.getText());
                                            }else if (text == 'Items') {
                                                Items = new List<Items >();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              Items .add(new Items(parser));
                                               }
                                            }
                                         }
                                   }
                            }
    }    
    
      
     //Get Advertiser Data List from Adzerk          
      webService static AdzerkAdvertiserService GetAdvertiserList(String accessApikey) {  
                String Apiendpoint= 'http://api.adzerk.net/v1/advertiser'; 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                return new AdzerkAdvertiserService(System.JSON.createParser(res.getbody()));
     }
     //Get Advertiser based on id from Adzerk          
      webService static AdzerkAdvertiserService.Items GetAdvertiser(String accessApikey,Integer id) {   
                String Apiendpoint= 'http://api.adzerk.net/v1/advertiser';
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint+'/'+id);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                return new  AdzerkAdvertiserService.Items(System.JSON.createParser(res.getbody()));
     }
       //Get Search advertiser based on advertiser name from adzerk          
      webService static AdzerkAdvertiserService SearchAdvertiser(String accessApikey,string AdvertiserName) {   
                String Apiendpoint= 'http://api.adzerk.net/v1/advertiser/search';
                Map<string,string> valuemap=new Map<string,string>();
                valuemap.put('advertiserName',AdvertiserName);
                string jsonContent= Json.Serialize(valuemap);  
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');  
                req.setBody(jsonContent);                     
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                return new  AdzerkAdvertiserService (System.JSON.createParser(res.getbody()));
     }
      //Create Advertiser on Adzerk    
       webService static AdzerkAdvertiserService.Items CreateAdvertiser(String accessApikey,AdzerkAdvertiserService.Items advertiser) {
                String Apiendpoint= 'http://api.adzerk.net/v1/advertiser';
                string jsonContent= Json.Serialize(advertiser);                
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('POST');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('advertiser='+jsonContent);
                req.setEndpoint(Apiendpoint);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkAdvertiserService.Items(System.JSON.createParser(res.getbody()));
      }
     //Update Advertiser on Adzerk    
      webService static AdzerkAdvertiserService.Items  UpdateAdvertiser(String accessApikey,Integer id,AdzerkAdvertiserService.Items advertiser) {
                String Apiendpoint= 'http://api.adzerk.net/v1/advertiser';
                string jsonContent= Json.Serialize(advertiser); 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('PUT');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('advertiser='+jsonContent);               
                req.setEndpoint(Apiendpoint+'/'+id);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkAdvertiserService.Items(System.JSON.createParser(res.getbody()));
     } 
  
}