//
//  ParsingManager.swift
//  Assignment1
//
//  Created by Thanos on 11/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation

class ParsingManager: NSObject {
    var finalDisplayString = ""
    let xmlString: String = """
<items>
    <item>
        <author>Robi</author>
        <description>My article about Olympics</description>
        <tag name = "Olympics" count = "3"/>
        <tag name = "Rio"/>
    </item>
    <item>
        <author>Robi</author>
        <description>I can't wait Spa-Francorchamps!!</description>
        <tag name = "Formula One"/>
        <tag name = "Eau Rouge" count = "5"/>
    </item>
</items>
"""
    var xmlData:Data?
    var xmlParser: XMLParser?
    
    var items = [Item]();
    var item = Item();
    var foundCharacters = "";
    
    func parseXML(){
        
        finalDisplayString.append("\(xmlString)\n\n")
        finalDisplayString.append("\n\nPARSED STRING")
        xmlData = xmlString.data(using: String.Encoding.utf8)
        xmlParser = XMLParser(data: xmlData!)
        
        xmlParser?.delegate = self
        xmlParser?.parse()
        
    }
}

extension ParsingManager: XMLParserDelegate{
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "tag" {
            let tempTag = Tag()
            if let name = attributeDict["name"] {
                tempTag.name = name
            }
            if let c = attributeDict["count"] {
                if let count = Int(c) {
                    tempTag.count = count
                }
            }
            self.item.tag.append(tempTag)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.foundCharacters += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "author" {
            self.item.author = self.foundCharacters
        }
        
        if elementName == "description" {
            self.item.desc = self.foundCharacters
        }
        
        if elementName == "item" {
            let tempItem = Item();
            tempItem.author = self.item.author
            tempItem.desc = self.item.desc
            tempItem.tag = self.item.tag
            self.items.append(tempItem)
            self.item.tag.removeAll()
        }
        self.foundCharacters = ""
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        for item in self.items {
            print("\(item.author)\n\(item.desc)")
            finalDisplayString.append("\(item.author)\(item.desc)\n")
            for tags in item.tag {
                if let count = tags.count {
                    finalDisplayString.append("      \(tags.name) \(count)\n")
                    print("\(tags.name), \(count)")
                } else {
                    finalDisplayString.append("\(tags.name)\n")
                    print("  \(tags.name)\n")
                }
            }
            print("\n")
            finalDisplayString.append("\n")
            
        }
        
    }
}
