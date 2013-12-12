public class AdzerkFlightService {

    public class GeoTargeting {
        public String CountryCode;
        public String Region;
        public Integer MetroCode;
        public Boolean IsExclude;
        
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

    
    public AdzerkFlightService(JSONParser parser) {
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
                                                }
                                         }
                                 }
                       }
    }
     //Get Flight Data from Adzerk
     public AdzerkFlightService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
     }
     public AdzerkFlightService (String accessToken, String id) {
                this(accessToken, id, null);
     }
     //Create Flight on Adzerk    
     public AdzerkFlightService CreateFlight (String accessToken, String id, Map<String, String> params) {
                return new AdzerkFlightService (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
     }
     //Update Flight on Adzerk    
     public AdzerkFlightService UpdateFlight(String accessToken, String id, Map<String, String> params) {
                return new AdzerkFlightService (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
     }
     public static AdzerkFlightService parse(String json) {
                return new AdzerkFlightService (System.JSON.createParser(json));
     }


    
    static testMethod void testParse() {
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
    }
}