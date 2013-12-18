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

global with sharing class AdzerkCampaignService {

    public class Flights {
        public String EndDate;
        public Integer ChannelId;
        public String Keywords;
        public String Name;
        public Boolean IsDeleted;
        public String StartDate;
        public String Price;
        public Integer Impressions;
        public Boolean NoEndDate;
         public Flights(){}
         public Flights (JSONParser parser) {
         while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'EndDate'){
                                            EndDate=parser.getText();
                                            } else if (text == 'ChannelId') {
                                             ChannelId=Integer.Valueof(parser.getText());
                                             } else if (text == 'Keywords') {
                                                Keywords=parser.getText();
                                             } else if (text == 'Name') {
                                                Name=parser.getText();
                                             }else if (text == 'IsDeleted') {
                                                IsDeleted=Boolean.Valueof(parser.getText());
                                             }else if (text == 'StartDate') {
                                                StartDate=parser.getText();
                                             }else if (text == 'Price') {
                                                Price=parser.getText();
                                             }else if (text == 'Impressions') {
                                                Impressions=Integer.Valueof(parser.getText());
                                             }else if (text == 'NoEndDate') {
                                                NoEndDate=Boolean.Valueof(parser.getText());
                                             }
                                         }
                                   }
                            }
   
         }        
 
    }


    public class Items{
 /* property keys */
    public Integer Id;
    public String EndDate;
    public Integer AdvertiserId;
    public String Name;
    public List<Flights> Flights;
    public Boolean IsDeleted;
    public String StartDate;
    public String Price;
    public Boolean IsActive;

    /* Constructor */
    public Items(){}
    public Items(JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                       if (text == 'Id'){
                                            Id=Integer.Valueof(parser.getText());
                                            }else if (text == 'EndDate'){
                                            EndDate=parser.getText();
                                            } else if (text == 'AdvertiserId') {
                                             AdvertiserId=Integer.Valueof(parser.getText());
                                             } else if (text == 'Name') {
                                                Name=parser.getText();
                                             }else if (text == 'Flights') {
                                                Flights= new List<Flights>();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              Flights.add(new Flights(parser));
                                               }
                                             }else if (text == 'IsDeleted') {
                                                IsDeleted=Boolean.valueof(parser.getText());
                                             }else if (text == 'StartDate') {
                                                StartDate=parser.getText();
                                             }else if (text == 'Price') {
                                                Price=parser.getText();
                                             }else if (text == 'IsActive') {
                                                IsActive=Boolean.valueof(parser.getText());
                                             }
                                         }
                                   }
                            }
    }
   }
   public Integer TotalPages;
   public List<Items> Items;
   public  AdzerkCampaignService (){}
   public AdzerkCampaignService (JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'TotalPages'){
                                            TotalPages=Integer.Valueof(parser.getText());
                                            } else if (text == 'Items') {
                                                Items= new List<Items>();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              Items.add(new Items(parser));
                                               }
                                             }
                                         }
                                   }
                            }
    }
     
     //Get Campaign Data List from Adzerk          
     public AdzerkCampaignService GetCampaign  (String accessApikey) {  
                String Apiendpoint= 'http://api.adzerk.net/v1/campaign'; 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                return new AdzerkCampaignService (System.JSON.createParser(res.getbody()));
     }
     //Get Campaign based on id from Adzerk          
     public AdzerkCampaignService.Items GetCampaign  (String accessApikey,Integer id) {   
                String Apiendpoint= 'http://api.adzerk.net/v1/campaign';
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint+'/'+id);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                return new  AdzerkCampaignService.Items(System.JSON.createParser(res.getbody()));
     }
       
      //Create Campaign on Adzerk    
      public AdzerkCampaignService.Items CreateCampaign  (String accessApikey,AdzerkCampaignService.Items campaign) {
                String Apiendpoint= 'http://api.adzerk.net/v1/campaign';
                string jsonContent= Json.Serialize(campaign); 
                system.debug('==========jsonContent'+jsonContent);               
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('POST');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('campaign='+jsonContent);
                req.setEndpoint(Apiendpoint);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkCampaignService.Items(System.JSON.createParser(res.getbody()));
      }
    
     
     //Update Campaign on Adzerk    
     public AdzerkCampaignService.Items  UpdateCampaign  (String accessApikey,Integer id,AdzerkCampaignService.Items campaign) {
                String Apiendpoint= 'http://api.adzerk.net/v1/campaign';
                string jsonContent= Json.Serialize(campaign);  
                system.debug('===========jsonContent1'+jsonContent);              
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('PUT');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('campaign='+jsonContent);
                system.debug('===========jsonContent'+jsonContent);
                req.setEndpoint(Apiendpoint+'/'+id);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkCampaignService.Items(System.JSON.createParser(res.getbody()));
     } 
    
    
    /**
    //Starting apex v29 Test methods must be in test classes
    static testMethod void testParse() {
        String json = '{'+
        '  \"EndDate\":\"12/31/2011\",'+
        '  \"AdvertiserId\":123,'+
        '  \"Name\":\"Test\",'+
        '  \"Flights\":[{'+
        '    \"EndDate\":\"12/31/2011\",'+
        '    \"ChannelId\":1234,'+
        '    \"Keywords\":\"test, test2\",'+
        '    \"Name\":\"Test Flight\",'+
        '    \"IsDeleted\":false,'+
        '    \"StartDate\":\"1/1/2011\",'+
        '    \"Price\":\"5.00\",'+
        '    \"Impressions\":10000,'+
        '    \"NoEndDate\":false'+
        '  }],'+
        '  \"IsDeleted\":false,'+
        '  \"StartDate\":\"1/1/2011\",'+
        '  \"Price\":\"10.00\",'+
        '  \"IsActive\":false'+
        '}';
        
        AdzerkCampaignService r = parse(json);
        System.assert(obj != null);
    }
    
    */
}