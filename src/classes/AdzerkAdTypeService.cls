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

global with sharing class AdzerkAdTypeService {

    global class Items {
      public Integer Id=0;
      public Integer Height;
      public Integer Width;
      public String Name='';
    public Items (){} 
    public Items (JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Id'){
                                            Id=Integer.Valueof(parser.getText());
                                            } else if (text == 'Height') {
                                             Height= Integer.Valueof(parser.getText());
                                             } else if (text == 'Width') {
                                                Width=Integer.Valueof(parser.getText());
                                             }else if (text == 'Name') {
                                                Name=parser.getText();
                                             }
                                             
                                         }
                                   }
                            }
                  }        
    }

    public Integer page;
    public Integer pageSize;
    public Integer totalPages;
    public Integer totalItems;
    public List<Items> items;
    public AdzerkAdTypeService(){}
    public AdzerkAdTypeService(JSONParser parser) {    
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'page'){
                                            page=Integer.Valueof(parser.getText());
                                            } else if (text == 'pageSize') {
                                             pageSize= Integer.Valueof(parser.getText());
                                             } else if (text == 'totalPages') {
                                                totalPages=Integer.Valueof(parser.getText());
                                             }else if (text == 'totalItems') {
                                                totalItems=Integer.Valueof(parser.getText());
                                             }else if (text == 'Items') {
                                                Items = new List<Items >();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              Items.add(new Items(parser));
                                               }
                                             }
                                             
                                         }
                                   }
                            }
    }
    //Get Ad Type (Network) Data from Adzerk
     webService static AdzerkAdTypeService GetAdType(String accessApikey) {  
                String Apiendpoint= 'http://api.adzerk.net/v1/adtypes'; 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);                       
                return new AdzerkAdTypeService(System.JSON.createParser(res.getbody()));
     }   
     //Delete Ad Type (Network) based on id from Adzerk          
      webService static string DeleteAdType(String accessApikey,Integer id) {   
                String Apiendpoint= 'http://api.adzerk.net/v1/adtypes/'+id+'/delete';
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
    //Create Ad Type (Network)on Adzerk    
      webService static AdzerkAdTypeService.Items  CreateAdType(String accessApikey,AdzerkAdTypeService.Items adtype) {
                String Apiendpoint= 'http://api.adzerk.net/v1/adtypes';
                string jsonContent= Json.Serialize(adtype); 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('POST');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('adtype='+jsonContent);
                req.setEndpoint(Apiendpoint);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkAdTypeService.Items(System.JSON.createParser(res.getbody()));
      }
    
    //Get Ad Type (Channel) Data from Adzerk, based on ChannelId 
     webService static AdzerkAdTypeService GetAdTypeByChannelId(String accessApikey,Integer ChannelId) {  
                String Apiendpoint= 'http://api.adzerk.net/v1/channel/'+ChannelId+'/adtypes'; 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);   
                return new AdzerkAdTypeService(System.JSON.createParser(res.getbody()));
     } 
     
     //Delete Ad Type (Channel) based on id from Adzerk based on Id          
      webService static string DeleteAdTypeByChannelId(String accessApikey,Integer ChannelId,Integer id) {   
                String Apiendpoint= 'http://api.adzerk.net/v1/channel/'+ChannelId+'/adtypes/'+id+'/delete';
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
     //Create Ad Type (Channel)on Adzerk, based on ChannelId   
      webService static AdzerkAdTypeService.Items  CreateAdTypeByChannelId(String accessApikey,Integer ChannelId,AdzerkAdTypeService.Items adtype) {
                String Apiendpoint= 'http://api.adzerk.net/v1/channel/'+ChannelId+'/adtype';
                string jsonContent= Json.Serialize(adtype); 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('POST');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('adtype='+jsonContent);
                req.setEndpoint(Apiendpoint);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkAdTypeService.Items(System.JSON.createParser(res.getbody()));
      }
   
}