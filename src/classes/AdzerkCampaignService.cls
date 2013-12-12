global class AdzerkCampaignService {

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


   
 /* property keys */
    public String EndDate;
    public Integer AdvertiserId;
    public String Name;
    public List<Flights> Flights;
    public Boolean IsDeleted;
    public String StartDate;
    public String Price;
    public Boolean IsActive;

    /* Constructor */
    
    public AdzerkCampaignService(JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'EndDate'){
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
     //Get Campaign Data from Adzerk 
     public AdzerkCampaignService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
        }  
     public AdzerkCampaignService (String accessToken, String id) {
                this(accessToken, id, null);
        }
     //Create Campaign on Adzerk    
     public AdzerkCampaignService CreateCampaign (String accessToken, String id, Map<String, String> params) {
                return new AdzerkCampaignService (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
        }
     //Update Campaign on Adzerk    
     public AdzerkCampaignService UpdateCampaign(String accessToken, String id, Map<String, String> params) {
                return new AdzerkCampaignService (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
        }
     public static AdzerkCampaignService parse(String json) {
               return new AdzerkCampaignService (System.JSON.createParser(json));
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