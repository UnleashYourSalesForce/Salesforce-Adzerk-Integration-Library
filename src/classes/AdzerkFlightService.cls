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

global with sharing class AdzerkFlightService {

    public class GeoTargeting {
        public String CountryCode;
        public String Region;
        public Integer MetroCode;
        public Boolean IsExclude;
         public GeoTargeting(){}
    public GeoTargeting(JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'CountryCode'){
                                            CountryCode=parser.getText();
                                            } else if (text == 'Region') {
                                             Region= parser.getText();
                                             } else if (text == 'MetroCode') {
                                                MetroCode=Integer.Valueof(parser.getText());
                                                }else if (text == 'IsExclude') {
                                                IsExclude= Boolean.Valueof(parser.getText());
                                                }
                                         }
                                   }
                            }
                  }
    }

    public class SiteZoneTargeting {
        public Integer SiteId;
        public Integer ZoneId;
        public Boolean IsExclude;
        public SiteZoneTargeting (){}
    public SiteZoneTargeting (JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'SiteId'){
                                            SiteId=Integer.Valueof(parser.getText());
                                            } else if (text == 'ZoneId') {
                                             ZoneId= Integer.Valueof(parser.getText());
                                             } else if (text == 'IsExclude') {
                                                IsExclude=Boolean.Valueof(parser.getText());
                                                }
                                         }
                                   }
                            }
                  }
        
    }
    public class Items {
    public String StartDate;
    public String EndDate;
    public Boolean NoEndDate;
    public Double Price;
    public Integer Impressions;
    public Boolean IsUnlimited;
    public Boolean IsNoDuplicates;
    public Boolean IsFullSpeed;
    public String Keywords;
    public String UserAgentKeywords;
    public String Name;
    public Boolean IsFreqCap;
    public Integer CampaignId;
    public Integer PriorityId;
    public Boolean IsDeleted;
    public Boolean IsActive;
    public List<GeoTargeting> GeoTargeting;
    public List<SiteZoneTargeting> SiteZoneTargeting;
    public Integer ECPMOptimizePeriod;
    public Double ECPMMultiplier;
    public Double FloorECPM;
    public Double CeilingECPM;
    public Double DefaultECPM;
    public Integer ECPMBurnInImpressions;
    public Boolean IsECPMOptimized;
    public Integer Id;

     public Items (){}
    public Items (JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'StartDate'){
                                            StartDate=parser.getText();
                                            } else if (text == 'EndDate') {
                                             EndDate= parser.getText();
                                             } else if (text == 'NoEndDate') {
                                                NoEndDate= boolean.valueof(parser.getText());
                                                }else if (text == 'Price') {
                                                Price =Double.valueof(parser.getText());
                                                }else if (text == 'Impressions') {
                                                Impressions=Integer.valueof(parser.getText());
                                                }else if (text == 'IsUnlimited') {
                                                IsUnlimited=boolean.valueof(parser.getText());
                                                }else if (text == 'IsNoDuplicates') {
                                                IsNoDuplicates=boolean.valueof(parser.getText());
                                                }else if (text == 'IsFullSpeed') {
                                                IsFullSpeed=boolean.valueof(parser.getText());
                                                }else if (text == 'Keywords') {
                                                Keywords=parser.getText();
                                                }else if (text == 'UserAgentKeywords') {
                                                UserAgentKeywords=parser.getText();
                                                }else if (text == 'Name') {
                                                Name=parser.getText();
                                                }else if (text == 'IsFreqCap') {
                                                IsFreqCap=boolean.valueof(parser.getText());
                                                }else if (text == 'CampaignId') {
                                                CampaignId=Integer.ValueOf(parser.getText());
                                                }else if (text == 'PriorityId') {
                                                PriorityId=Integer.ValueOf(parser.getText());
                                                }else if (text == 'IsDeleted') {
                                                IsDeleted=boolean.valueof(parser.getText());
                                                }else if (text == 'IsActive') {
                                                IsActive=boolean.valueof(parser.getText());
                                                }else if (text == 'GeoTargeting') {
                                                GeoTargeting= new List<GeoTargeting>();
                                                while (parser.nextToken() != JSONToken.END_ARRAY) {
                                                GeoTargeting.add(new GeoTargeting(parser));
                                               }
                                             }else if (text == 'SiteZoneTargeting') {
                                                SiteZoneTargeting= new List<SiteZoneTargeting>();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              SiteZoneTargeting.add(new SiteZoneTargeting(parser));
                                               }
                                             }else if (text == 'ECPMOptimizePeriod') {
                                                ECPMOptimizePeriod=Integer.ValueOf(parser.getText());
                                                }else if (text == 'ECPMMultiplier') {
                                                ECPMMultiplier=Double.ValueOf(parser.getText());
                                                }else if (text == 'FloorECPM') {
                                                FloorECPM=Double.valueof(parser.getText());
                                                }else if (text == 'CeilingECPM') {
                                                CeilingECPM=Double.valueof(parser.getText());
                                                }else if (text == 'DefaultECPM') {
                                                DefaultECPM=Double.valueof(parser.getText());
                                                }else if (text == 'ECPMBurnInImpressions') {
                                                ECPMBurnInImpressions=Integer.valueof(parser.getText());
                                                }else if (text == 'IsECPMOptimized') {
                                                IsECPMOptimized=boolean.valueof(parser.getText());
                                                }else if (text == 'Id') {
                                                Id=Integer.valueof(parser.getText());
                                                }
                                         }
                                 }
                       }
    }
   } 
   
    public Integer TotalPages;
    public List<Items> Items;
    public AdzerkFlightService (){} 
    public AdzerkFlightService (JSONParser parser) {
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
     //Get Flight Data List from Adzerk          
     public AdzerkFlightService GetFlight (String accessApikey) {  
                String Apiendpoint= 'http://api.adzerk.net/v1/flight'; 
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                return new AdzerkFlightService(System.JSON.createParser(res.getbody()));
     }
     //Get Flight based on id from Adzerk          
     public AdzerkFlightService.Items GetFlight (String accessApikey,Integer id) {   
                String Apiendpoint= 'http://api.adzerk.net/v1/flight';
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');                       
                req.setEndpoint(Apiendpoint+'/'+id);                         
                HttpResponse res=new HttpResponse();
                res = h.send(req);              
                return new  AdzerkFlightService.Items(System.JSON.createParser(res.getbody()));
     }
       
      //Create Flight on Adzerk    
      public AdzerkFlightService.Items CreateFlight  (String accessApikey,AdzerkFlightService.Items flight) {
                String Apiendpoint= 'http://api.adzerk.net/v1/flight';
                string jsonContent= Json.Serialize(flight); 
                system.debug('==========jsonContent'+jsonContent);               
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('POST');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('flight='+jsonContent);
                req.setEndpoint(Apiendpoint);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkFlightService.Items(System.JSON.createParser(res.getbody()));
      }
    
     
     //Update Flight on Adzerk    
     public AdzerkFlightService.Items  UpdateFlight  (String accessApikey,Integer id,AdzerkFlightService.Items flight) {
                String Apiendpoint= 'http://api.adzerk.net/v1/flight';
                string jsonContent= Json.Serialize(flight);  
                system.debug('===========jsonContent1'+jsonContent);              
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('PUT');
                req.setHeader('X-Adzerk-ApiKey',accessApikey);
                req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.setBody('flight='+jsonContent);
                system.debug('===========jsonContent'+jsonContent);
                req.setEndpoint(Apiendpoint+'/'+id);                        
                HttpResponse res=new HttpResponse();
                res = h.send(req);
                return new AdzerkFlightService.Items(System.JSON.createParser(res.getbody()));
     } 
    

    
   /* static testMethod void testParse() {
        String json = '{'+
        '  \"StartDate\":\"1/1/2011\",'+
        '  \"EndDate\":\"12/31/2011\",'+
        '  \"NoEndDate\":false,'+
        '  \"Price\":10.00,'+
        '  \"Impressions\":10000,'+
        '  \"IsUnlimited\":false,'+
        '  \"IsNoDuplicates\":false,'+
        '  \"IsFullSpeed\":false,'+
        '  \"Keywords\":\"test, test2\",'+
        '  \"UserAgentKeywords\":\"\",'+
        '  \"Name\":\"Test\",'+
        '  \"IsFreqCap\":false,'+
        '  \"CampaignId\":1234,'+
        '  \"PriorityId\":1234,'+
        '  \"IsDeleted\":false,'+
        '  \"IsActive\":true,'+
        '  \"GeoTargeting\":[{'+
        '    \"CountryCode\":\"US\",'+
        '    \"Region\":\"NC\",'+
        '    \"MetroCode\":560,'+
        '    \"IsExclude\":false'+
        '  }],'+
        '  \"SiteZoneTargeting\":[{'+
        '    \"SiteId\":123,'+
        '    \"ZoneId\":321,'+
        '    \"IsExclude\":false'+
        '  }],'+
        '  \"ECPMOptimizePeriod\":30,'+
        '  \"ECPMMultiplier\":1.25,'+
        '  \"FloorECPM\":0.15,'+
        '  \"CeilingECPM\":0.35,'+
        '  \"DefaultECPM\":0.28,'+
        '  \"ECPMBurnInImpressions\":1000'+
        '}';
        AdzerkFlightService obj = parse(json);
        System.assert(obj != null);
    }*/
}