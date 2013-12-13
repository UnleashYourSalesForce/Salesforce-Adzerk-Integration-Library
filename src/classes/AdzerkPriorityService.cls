public class AdzerkPriorityService {

    public class Items {
        public Integer Id;
        public String Name;
        public Integer ChannelId;
        public Integer Weight;
        public Boolean IsDeleted;
        
     public Items (JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Id'){
                                            Id=Integer.Valueof(parser.getText());
                                            } else if (text == 'Name') {
                                             Name= parser.getText();
                                             } else if (text == 'ChannelId') {
                                                ChannelId=Integer.Valueof(parser.getText());
                                             }else if (text == 'Weight') {
                                                Weight=Integer.Valueof(parser.getText());
                                             }else if (text == 'IsDeleted') {
                                                IsDeleted=Boolean.Valueof(parser.getText());
                                             }
                                             
                                         }
                                   }
                            }
                  }    
    }

    public Integer TotalPages;
    public List<Items> Items;
    
    public AdzerkPriorityService (JSONParser parser) {    
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'TotalPages'){
                                            TotalPages=Integer.Valueof(parser.getText());
                                            } else if (text == 'Items ') {
                                                Items = new List<Items >();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              Items .add(new Items(parser));
                                               }
                                             }
                                             
                                         }
                                   }
                            }
    }
    
    //Get Priority Data from Adzerk 
    public AdzerkPriorityService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
    }        
    public AdzerkPriorityService (String accessToken, String id) {
                this(accessToken, id, null);
    }
    //Create Priority on Adzerk 
    public AdzerkPriorityService.Items CreatePriority(String accessToken, String id, Map<String, String> params) {
                return new AdzerkPriorityService.Items (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
    }
    //Update Priority on Adzerk
    public AdzerkPriorityService.Items UpdatePriority(String accessToken, String id, Map<String, String> params) {
                return new AdzerkPriorityService.Items(System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
    }
    
    public static AdzerkPriorityService parse(String json) {
        return new AdzerkPriorityService (System.JSON.createParser(json));
    }
    
    /*static testMethod void testParse() {
        String json = '{'+
        '  \"TotalPages\":1,'+
        '  \"Items\":[{'+
        '    \"Id\":1234,'+
        '    \"Name\":\"High Priority\",'+
        '    \"ChannelId\":1234,'+
        '    \"Weight\":10,'+
        '    \"IsDeleted\":false'+
        '  }]'+
        '}';
        AdzerkPriorityService obj = parse(json);
        System.assert(obj != null);
    }*/
}