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

global with sharing class AdzerkPriorityService {

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