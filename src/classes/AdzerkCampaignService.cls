public class AdzerkCampaignService {

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