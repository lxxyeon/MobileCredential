//
//  TimeLineView.swift
//  MobileCredential
//
//  Created by leeyeon2 on 2021/12/19.
//

import Foundation
import UIKit
import CoreNFC

class ExpandingTableViewCellContent {
    var expanded: Bool
    init() {
        self.expanded = false
    }
}

class TimeLineView: UIView, UITableViewDataSource, UITableViewDelegate, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet var timelineTable2: UITableView!
    private let xibName = "TimeLineView"
    
    var test = 1
    var nfcManager: NFCManager?
    var tagReaderSession: NFCTagReaderSession?
//    private var session = nfcObject.tagReaderSession
//    var message = nfcObject.detectedMessages

    let reuseIdentifier = "reuseIdentifier"
    var detectedMessages = [NFCNDEFMessage]()
    var session: NFCNDEFReaderSession?
    var count: NSInteger = 1
        
    var answerFilterDatasource =  ExpandingTableViewCellContent()
//  let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnails, illustration, checkIn, seatNo, placeNo, placeIcon, checkBox, main, inputTime, TimeIcon, Period)
    
    var data:[Int: [(TimelinePoint, UIColor, String, String?, String?, [String]?, String?, Int?, String?, String?, Int?, Int?,Int?,String?,Int?,String?)]] =
        [0:[
//            (TimelinePoint(type: 0), #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1), "07:00", nil,"출근", nil, nil, 0, " ", "한화빌딩 13F",1,1,1,"07:55",nil,nil),
            
            
            (TimelinePoint(type: 0), #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1), "07:00", nil,"출근", nil, nil, 0, nil, "한화빌딩 13F",1,1,1,"07:48",nil,nil),
            
            (TimelinePoint(type: 0), #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1), "08:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2,nil,nil,nil),
    
            (TimelinePoint(type: 0), #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1), "09:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2,nil,nil,nil),
//            (TimelinePoint(type: 0), #colorLiteral(rd: 1, green: 0.5159558058, blue: 0.1484099925, alpha: 1), "10:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2),
            
            (TimelinePoint(type: 0), #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1), "10:00", nil, "거점이동", nil, nil, 0, nil, "여의도손보빌딩 15F",1,1,1,"10:30",nil, nil),
            
//            (TimelinePoint(type: 0), #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1), "11:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2,nil,nil,nil),
            (TimelinePoint(type: 0), #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1),"11:00",nil , "HSP Meeting", nil, nil, 0, "C1301","장교빌딩 13F, ",1,1,1,"11:30",1, "11:30~11:55"),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1),"12:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2,nil,nil,nil),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1),"13:00",nil , "HSP Meeting", nil, nil, 0, "C1301","장교빌딩 13F, ",1,1,1,"13:30",1, "13:30~13:55"),
            
//            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "13:30", "\n \n", "거점 이동", nil, nil, 0, "장교빌딩 13F", nil,1,1,2,nil,nil,nil),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1),"14:00",nil , "HPMP Presentation", nil, nil, 0, "C1301","장교빌딩 13F, ",1,1,1,"14:30",1, "14:30~14:55"),
            
//            (TimelinePoint(color: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1), filled: true), #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1), "14:00", nil, nil, nil, nil, 0, nil, nil,nil,nil),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "15:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2,nil,nil,nil),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "16:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2,nil,nil,nil),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1),"17:00", nil, "퇴근", nil, nil, 0, nil, "여의도손보빌딩 15F",1,1,1,"17:47",nil,nil),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), backColor: UIColor.clear, "18:00", nil, nil, nil, nil, 0, nil, nil,nil,nil,2,nil,nil,nil)
//            ,
//
//
//            (TimelinePoint(type: 0), backColor: UIColor.clear, "18:00", nil, "퇴근", nil, nil, nil, nil, nil,0)
//
//            (TimelinePoint(type: 0), UIColor.clear , "18:00", nil, "퇴근", nil, nil, 0, nil, "한화빌딩 13F",1,1,1,"17:47",nil,nil),
        
        
        
        
        
        
        ]
//        , 1:[
//            (TimelinePoint(type: 0), UIColor.darkGray, "12:45", nil, "거점 이동", nil, nil, 0, nil, "장교빌딩 16F",1),
//            (TimelinePoint(type: 2), UIColor.darkGray, "13:00", "\n \n", "HSP 회의", nil, nil, 0, "장교빌딩 C1502", nil,1),
//            (TimelinePoint(type: 1), backColor: UIColor.clear, "17:45", nil, "퇴근", nil, nil, nil, nil, nil,0)
//        ]
        ]

    override func awakeFromNib() {
        super.awakeFromNib()
        if let tableV = self.timelineTable2 {
            let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell", bundle: Bundle(for: TimelineTableViewCell.self))
            tableV.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
            tableV.rowHeight = UITableView.automaticDimension
            tableV.estimatedRowHeight = UITableView.automaticDimension
//            tableV.translatesAutoresizingMaskIntoConstraints = false
//            tableV.rowHeight = 10
//            tableV.estimatedRowHeight = 10
            
        }
//        let indexPath = IndexPath(row: 1, section: 1)
//        self.timelineTable2.scrollToRow(at: indexPath, at: .none, animated: true)
//
//        self.timelineTable2.layer.cornerRadius = 15
//        self.timelineTable2.layer.shadowOffset = CGSize(width: 1, height: 1);
//        self.timelineTable2.layer.shadowRadius = 2
//        self.timelineTable2.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        self.timelineTable2.layer.shadowOpacity = 0.2
//
////        self.timelineTable2.layer.shadowOffset = CGSize (width: 0.0, height: 2.0)
////        self.timelineTable2.layer.shadowColor = UIColor.black.cgColor
////        self.timelineTable2.layer.shadowOpacity = 0.6
////        self.timelineTable2.layer.shadowRadius = 4
//        self.timelineTable2.clipsToBounds = false // turn off masking to show shadows
//        self.timelineTable2.dataSource = self
   }

    // MARK: - NFCNDEFReaderSessionDelegate

    /// - Tag: processingTagData
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        DispatchQueue.main.async {
            // Process detected NFCNDEFMessage objects.
            self.detectedMessages.append(contentsOf: messages)
            self.timelineTable2.reloadData()
        }
    }

    /// - Tag: processingNDEFTag
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        if tags.count > 1 {
            // Restart polling in 500ms
            let retryInterval = DispatchTimeInterval.milliseconds(500)
            session.alertMessage = "More than 1 tag is detected, please remove all tags and try again."
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval, execute: {
                session.restartPolling()
            })
            return
        }
        
        // Connect to the found tag and perform NDEF message reading
        let tag = tags.first!
        session.connect(to: tag, completionHandler: { (error: Error?) in
            if nil != error {
                session.alertMessage = "Unable to connect to tag."
                session.invalidate()
                return
            }
            
            tag.queryNDEFStatus(completionHandler: { (ndefStatus: NFCNDEFStatus, capacity: Int, error: Error?) in
                if .notSupported == ndefStatus {
                    session.alertMessage = "Tag is not NDEF compliant"
                    session.invalidate()
                    return
                } else if nil != error {
                    session.alertMessage = "Unable to query NDEF status of tag"
                    session.invalidate()
                    return
                }
                
                tag.readNDEF(completionHandler: { (message: NFCNDEFMessage?, error: Error?) in
                    var statusMessage: String
                    
                    if nil != error || nil == message {
                        statusMessage = "Fail to read NDEF from tag"
                    } else {
                        statusMessage = "A23 좌석이 점유되었습니다."
                        if(self.test == 1){
                            statusMessage = "A23 좌석이 점유되었습니다."
                        }else if(self.test == 0){
                            statusMessage = "A23 좌석이 점유가 해제되었습니다."
                        }
//
                        DispatchQueue.main.async {
                            // Process detected NFCNDEFMessage objects.
                            self.detectedMessages.append(message!)
//
//                            if(self.test == 1){
//                                self.data.updateValue([(TimelinePoint(type: 0), UIColor.darkGray, "07:45", nil, "출근", nil, nil, 1, "A23", "여의도손보빌딩 15F,",1),
//                                                       (TimelinePoint(type: 2), UIColor.darkGray, "10:30", "\n \n", "KPI 회의", nil, nil, 0, "여의도손보빌딩 C1501", nil,1)
//                                                   ], forKey: 0)
//                                self.test = 0
//
//                            }else if(self.test == 0){
//                                self.data.updateValue([(TimelinePoint(type: 0), UIColor.darkGray, "07:45", nil, "출근", nil, nil, 0, nil, "여의도손보빌딩 15F",1),
//                                                       (TimelinePoint(type: 2), UIColor.darkGray, "10:30", "\n \n", "KPI 회의", nil, nil, 0, "여의도손보빌딩 C1501", nil,1)
//                                                   ], forKey: 0)
//                                self.test = 1
//
//                            }
                            
                            self.timelineTable2.reloadData()
                            
                        }
                    }
                    
                    session.alertMessage = statusMessage
                    session.invalidate()
                })
            })
        })
    }
    
    /// - Tag: sessionBecomeActive
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        
    }
    
    /// - Tag: endScanning
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        // Check the invalidation reason from the returned error.
        if let readerError = error as? NFCReaderError {
            // Show an alert when the invalidation reason is not because of a
            // successful read during a single-tag read session, or because the
            // user canceled a multiple-tag read session from the UI or
            // programmatically using the invalidate method call.
            if (readerError.code != .readerSessionInvalidationErrorFirstNDEFTagRead)
                && (readerError.code != .readerSessionInvalidationErrorUserCanceled) {
                let alertController = UIAlertController(
                    title: "Session Invalidated",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                DispatchQueue.main.async {
                    UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
//                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

        // To read new tags, a new session instance is required.
        self.session = nil
    }

    // MARK: - addMessage(fromUserActivity:)

    func addMessage(fromUserActivity message: NFCNDEFMessage) {
        DispatchQueue.main.async {
            self.detectedMessages.append(message)
            self.timelineTable2.reloadData()
            
        }
    }

//    func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//
//        return data.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
//    {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//timeLabel
//        let label = UILabel(frame: CGRect(x:(tableView.frame.size.width)/2-10, y: (headerView.frame.size.height)/7, width: tableView.bounds.size.width, height: 30))
//        //        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//        label.textAlignment = .justified
//
//        if (section == 0) {
//            headerView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
//            label.text = "AM"
//            label.font = UIFont(name: "NanumBarunGothicBold", size: 15.0)
//            //            label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
//            label.textColor = #colorLiteral(red: 0.2291017092, green: 0.07732711606, blue: 0.5, alpha: 1)
//        } else {
//            headerView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
//            label.text = "PM"
//            label.font = UIFont(name: "NanumBarunGothicBold", size: 15.0)
//            //            label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
//            label.textColor = #colorLiteral(red: 0.2291017092, green: 0.07732711606, blue: 0.5, alpha: 1)
//        }
//
//        headerView.addSubview(label)
//        return headerView
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 35
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell

        
        cell.settingData(isClicked: answerFilterDatasource)
        
        // Configure the cell...
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnails, illustration, checkIn, seatNo, placeNo, placeIcon, checkBox, main, inputTime, TimeIcon, Period) = sectionData[indexPath.row]
        //타임라인 시간

        var timelineFrontColor = UIColor.clear

        if (indexPath.row > 0) {
            timelineFrontColor = sectionData[indexPath.row - 1].1
        }
        cell.frameView.layer.cornerRadius = 10
        cell.frameView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.frameView.layer.shadowRadius = 2
        cell.frameView.layer.shadowColor = UIColor.black.cgColor
        cell.frameView.layer.shadowOpacity = 0.1;
        
        //TIMELINE
        cell.timelinePoint = timelinePoint
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = timelineBackColor
        
        cell.timeLabel.text = title
        cell.timeLabel.textColor = #colorLiteral(red: 0.4979992509, green: 0.4980617762, blue: 0.4979778528, alpha: 1)
        cell.timeLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)

        
        if main == 0{
            cell.mainTitleLabel.isHidden = false
            cell.mainCheckBox.isHidden = false
            cell.mainPlaceIcon.isHidden = false
            cell.mainPlaceLabel.isHidden = false
            cell.mainSeatLabel.isHidden = false
            
            cell.mainTitleLabel.text = lineInfo
            cell.mainTitleLabel.font = UIFont(name: "NanumBarunGothicBold", size: 17.0)
            cell.mainTitleLabel.textColor = #colorLiteral(red: 0.2509582043, green: 0.2509928346, blue: 0.2509464622, alpha: 1)
            
            cell.mainPlaceLabel.text = placeNo
            cell.mainPlaceLabel.font = UIFont(name: "NanumBarunGothic", size: 16.0)
            cell.mainTitleLabel.textColor = #colorLiteral(red: 0.2509582043, green: 0.2509928346, blue: 0.2509464622, alpha: 1)
            
            cell.mainSeatLabel.text = seatNo
            
            
            cell.mainCheckBox.image = UIImage(named: "Attendance-checked-green")
            
            cell.hiddenView.isHidden = true
            
            //이벤트 발생
        }else if main == 1{
            
            
            cell.mainTitleLabel.isHidden = true
            cell.mainCheckBox.isHidden = true
            cell.mainPlaceIcon.isHidden = true
            cell.mainPlaceLabel.isHidden = true
            cell.mainSeatLabel.isHidden = true
            
            cell.checkBox.isHidden = true
            
            
            cell.inputTime.font = UIFont(name: "NanumBarunGothic", size: 15.0)
            cell.inputTime.textColor = #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1)
            cell.inputTime.text = inputTime
            
            cell.hidenTitleLabel.text = lineInfo
            cell.hidenTitleLabel.font = UIFont(name: "NanumBarunGothicBold", size: 17.0)
            cell.hidenTitleLabel.textColor = #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1)


            if TimeIcon != nil {
                cell.meetingTimeIcon.image = UIImage(named: "timer")
            }
            else {
                cell.meetingTimeIcon.isHidden = true
            }
            
            if let Period = Period {
                cell.meetingTimeLabel.text = Period
                cell.meetingTimeLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
            }
            else {
                cell.meetingTimeLabel.text = nil
            }
            
            if let placeNo = placeNo {
                cell.placeLabel.text = placeNo
            }
            else {
                cell.placeLabel.text = nil
            }
            cell.placeLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
            cell.placeLabel.textColor = #colorLiteral(red: 0.2509582043, green: 0.2509928346, blue: 0.2509464622, alpha: 1)
            
            if let seatNo = seatNo {
                cell.seatLabel.text = seatNo
            }
            else {
                cell.seatLabel.text = nil
            }
            cell.seatLabel.font = UIFont(name: "NanumBarunGothic", size: 16.0)
            cell.seatLabel.textColor = #colorLiteral(red: 0.2509582043, green: 0.2509928346, blue: 0.2509464622, alpha: 1)
            

//            cell.meetingTimeLabel.text = "10:30~12:00"
//            cell.meetingTimeIcon.image = UIImage(named: "timer")
        }else{
            cell.mainTitleLabel.isHidden = true
            cell.mainCheckBox.isHidden = true
            cell.mainPlaceIcon.isHidden = true
            cell.mainPlaceLabel.isHidden = true
            cell.mainSeatLabel.isHidden = true
            
            cell.inputTime.font = UIFont(name: "NanumBarunGothicBold", size: 15.0)
            cell.inputTime.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            cell.inputTime.text = title
            cell.hiddenView.isHidden = true

        }

        
        if placeIcon == 0{
            cell.placeIcon.image = nil
        }else if placeIcon == 1{
            cell.placeIcon.image = UIImage(named: "icons8-place-marker-96 (1)")
        }else{
            cell.placeIcon.image = nil
        }

        
        
        //버튼 추가
        

        

//        cell.placeLabel.text = placeNo
        if let thumbnails = thumbnails {
            cell.viewsInStackView = thumbnails.map { thumbnail in
                return UIImageView(image: UIImage(named: thumbnail))
            }
        }
        else {
            cell.viewsInStackView = []
        }
        
        if let illustration = illustration {
            cell.illustrationImageView.image = UIImage(named: illustration)
        }
        else {
            cell.illustrationImageView.image = nil
        }
        
        return cell
    }
    
    
    @objc func test(_ sender: UIButton){
        guard NFCNDEFReaderSession.readingAvailable else {
            let alertController = UIAlertController(
                title: "Scanning Not Supported",
                message: "This device doesn't support tag scanning.",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
            return
        }
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session?.alertMessage = "핸드폰을 좌석 또는 회의실 태그 위에 태깅해주세요."
        session?.begin()
    }
    
    func onoffButtonConnected(sender : UIButton!) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = answerFilterDatasource
        content.expanded = !content.expanded
        self.timelineTable2.reloadRows(at: [indexPath], with: .automatic)
        guard data[indexPath.section] != nil else {
            return
        }
    }
}
extension TimeLineView: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("Tag reader did become active")
    }
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
       
    }
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        print("\(tags)")
    }
}

