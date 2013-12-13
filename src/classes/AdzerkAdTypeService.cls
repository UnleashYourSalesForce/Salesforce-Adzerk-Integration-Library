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

    public class Items {
        public Integer Id;
        public Integer Height;
        public Integer Width;
        public String Name;
        
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
                                             }else if (text == 'Items ') {
                                                Items = new List<Items >();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              Items .add(new Items(parser));
                                               }
                                             }
                                             
                                         }
                                   }
                            }
    }
    //Get AdType Data from Adzerk
    public AdzerkAdTypeService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
    }        
    public AdzerkAdTypeService (String accessToken, String id) {
                this(accessToken, id, null);
    }
    //Create AdType on Adzerk    
    public AdzerkAdTypeService.Items  CreateAdType (String accessToken, String id, Map<String, String> params) {
                return new AdzerkAdTypeService.Items  (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
    }
    //Update AdType on Adzerk
    public AdzerkAdTypeService.Items  UpdateAdType(String accessToken, String id, Map<String, String> params) {
                return new AdzerkAdTypeService.Items  (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
    }
    public static AdzerkAdTypeService parse(String json) {
              return new AdzerkAdTypeService (System.JSON.createParser(json));
    }
    
    static testMethod void testParse() {
        String json = '{'+
        '  \"page\": 1,'+
        '  \"pageSize\": 10,'+
        '  \"totalPages\": 1,'+
        '  \"totalItems\": 7,'+
        '  \"items\": ['+
        '    {'+
        '      \"Id\": 1,'+
        '      \"Height\": 90,'+
        '      \"Width\": 120,'+
        '      \"Name\": \"Button 1 and Text\"'+
        '    },'+
        '    {'+
        '      \"Id\": 2,'+
        '      \"Height\": 90,'+
        '      \"Width\": 120,'+
        '      \"Name\": \"Button 1\"'+
        '    },'+
        '    {'+
        '      \"Id\": 3,'+
        '      \"Height\": 60,'+
        '      \"Width\": 468,'+
        '      \"Name\": \"Full Banner\"'+
        '    },'+
        '    {'+
        '      \"Id\": 4,'+
        '      \"Height\": 90,'+
        '      \"Width\": 728,'+
        '      \"Name\": \"Leaderboard\"'+
        '    },'+
        '    {'+
        '      \"Id\": 5,'+
        '      \"Height\": 250,'+
        '      \"Width\": 300,'+
        '      \"Name\": \"Medium Rectangle\"'+
        '    },'+
        '    {'+
        '      \"Id\": 6,'+
        '      \"Height\": 600,'+
        '      \"Width\": 160,'+
        '      \"Name\": \"Wide Skyscraper\"'+
        '    },'+
        '    {'+
        '      \"Id\": 7,'+
        '      \"Height\": 600,'+
        '      \"Width\": 120,'+
        '      \"Name\": \"Skyscraper\"'+
        '    }'+
        '  ]'+
        '}';
        AdzerkAdTypeService obj = parse(json);
        System.assert(obj != null);
    }
}