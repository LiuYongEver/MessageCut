import Cocoa
import CreateML
import NaturalLanguage
import PlaygroundSupport

//剪信
let fileurl = Bundle.main.url(forResource: "lll", withExtension: "json")

let data = try MLDataTable(contentsOf: fileurl!)


let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)


let sentimentClassifier = try MLTextClassifier(trainingData: testingData,textColumn: "text",labelColumn: "label")

// 评估准确性百分比
let evaluationMetrics = sentimentClassifier.evaluation(on: testingData)
let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

var dict = {}

//验证模型
let sentimentPredictor = try NLModel(mlModel: sentimentClassifier.model)
sentimentPredictor.predictedLabel(for: "我是")

//导出模型
let metadata = MLModelMetadata(author: "feng",shortDescription: "短信过滤器",version: "1.0")
let mlFileUrl = playgroundSharedDataDirectory.appendingPathComponent("sms.mlmodel")

try sentimentClassifier.write(to: mlFileUrl,metadata: metadata)



//读取文件转JSON
//class Model:NSObject {
//    var label:String?
//    var text:String?
//
//}
//
//
//let sourceUrl = Bundle.main.url(forResource: "message", withExtension: "txt")
//let manager = FileManager.default
//let sourceData = manager.contents(atPath: sourceUrl!.path)
//let readString = String(data: sourceData!, encoding: String.Encoding.utf8)
//var spitString =  readString!.components(separatedBy: CharacterSet.newlines)
//
//
//spitString =  spitString.filter({
//    return $0 != ""
//})
//
//for i in 0..<spitString.count {
//     spitString[i].replacingOccurrences(of: " ", with: "")
//
//}
//
////spitString = ["0    sahdiashdiaw","1   aishdihwdihqwidh"]
//
//
//
//func appendFile(start:Int,index:Int){
//
//    var results = [[String:String]]();
//
//    for i in start..<index {
//            if spitString[i].count > 5 && String(spitString[i].first!) == "1" {
//                let index = spitString[i].index(spitString[i].startIndex, offsetBy: 5)
//
////                let dict:[String:String] = ["text":String(spitString[i][index...]),"label":(String(spitString[i].first!) == "0" ) ? "正常":"广告"];
//                    //只存广告数据
//                    let dict:[String:String] = ["label":"广告","text":String(spitString[i][index...])];
//                    results.append(dict)
//
//
//        }
//
//    }
//
//
//    //增量写入
//    do{
//        let data = try JSONSerialization.data(withJSONObject: results, options: .prettyPrinted) //转成json字符串
//        let fileurl = Bundle.main.url(forResource: "lll", withExtension: "json")
//        //                try data.write(to: fileurl!);
//        let handle =  try FileHandle.init(forUpdating: fileurl!)
//        handle.seekToEndOfFile()
//        handle.write(data);
//        handle.closeFile()
//    }catch{
//        print("error")
//    }
//}
//
//
//
//var next = spitString.count/1000
//
//for i in  0...1000 {
//    autoreleasepool{
//        appendFile(start: i*next, index: (i+1)*next);
//    }
//}

