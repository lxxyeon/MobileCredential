//
//  HistoryTimelineView.swift
//  MobileCredential
//
//  Created by leeyeon2 on 2021/12/19.
//

import Foundation
import UIKit
class HistoryTimelineView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var historyTableView: UITableView!
    
    private let xibName = "HistoryTimelineView"
    @objc public var dateTest: NSInteger = 1
    
    var data:[Int: [(TimelinePoint, UIColor, String, String?, String?, [String]?, String?, Int?, String?, String?, Int?)]] =
        [0:[(TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 07:45", nil, "출근", nil, nil, 0,  "한화빌딩 13F, A45",nil,1),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 10:00", nil, "파트 회의", nil, nil, 0, "한화빌딩 C1301", nil,1),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 11:30", nil, "주간 회의", nil, nil, 0, "한화빌딩 C1302", nil,1)
        ], 1:[
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 12:45", nil, "거점 이동", nil, nil, 0, "여의도손보빌딩 15F",nil,1),
            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 13:00", nil, "HSP 회의", nil, nil, 0, "여의도손보빌딩 C1502", nil,1),
//            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), backColor: UIColor.clear, "17:45", nil, "퇴근", nil, nil, nil, nil, nil,0)
        ]
        ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let tableV = self.historyTableView {
            let timelineTableViewCellNib = UINib(nibName: "HisTableViewCell", bundle: Bundle(for: HisTableViewCell.self))
            tableV.register(timelineTableViewCellNib, forCellReuseIdentifier: "HisTableViewCell")
            tableV.rowHeight = UITableView.automaticDimension
            tableV.estimatedRowHeight = UITableView.automaticDimension
        }
        let indexPath = IndexPath(row: 1, section: 1)
        self.historyTableView.scrollToRow(at: indexPath, at: .none, animated: true)
        
   }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
    
    @objc func test(_ sender: UIButton){
        let indexPath = IndexPath(row: 1, section: 1)
        self.historyTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
    }
    
    
    @objc open func dataSetting(_ date: NSInteger){
//        let indexPath = IndexPath(row: 1, section: 1)
//        self.historyTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
        //4/8
        if date == 1 {
            data =
                [0:[(TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 07:50", nil, "출근", nil, nil, 0, nil, "신설사옥 5F, A10",1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 10:30", nil, "Mobile Part Meeting", nil, nil, 0, "신설사옥 C501", nil,1)
                ], 1:[
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 14:30", nil, "HPMP Meeting", nil, nil, 0, "신설사옥 C502", nil,1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), backColor: UIColor.clear, " 18:15", nil, "퇴근", nil, nil, nil, nil, nil,0)
                ]]
            self.historyTableView.isHidden = false
            //4/9
        }else if date == 2 {
            data =
                [0:[(TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "07:45", nil, "출근", nil, nil, 0, nil, "여의도손보빌딩 15F, A45",1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "10:00", nil, "파트 회의", nil, nil, 0, "여의도손보빌딩 C1501", nil,1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "11:30", nil, "주간 회의", nil, nil, 0, "여의도손보빌딩 C1502", nil,1)
                ], 1:[
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "12:45", nil, "거점 이동", nil, nil, 0, nil, "장교빌딩 16F",1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "13:00", nil, "HSP 회의", nil, nil, 0, "장교빌딩 C1502", nil,1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), backColor: UIColor.clear, "17:45", nil, "퇴근", nil, nil, nil, nil, nil,0)
                ]]
            self.historyTableView.isHidden = false
        }else if date == 3 {
            
            self.historyTableView.isHidden = true
        }else if date == 4 {
            data =
                [0:[(TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "07:45", nil, "출근", nil, nil, 0, nil, "여의도손보빌딩 15F, A45",1)
                ], 1:[
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), "10:00", nil, "파트 회의", nil, nil, 0, "여의도손보빌딩 C1501", nil,1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), backColor: UIColor.clear, "17:45", nil, "퇴근", nil, nil, nil, nil, nil,0)
                ]]
            self.historyTableView.isHidden = false
        }else{
            data =
                [0:[(TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 07:45", nil, "출근", nil, nil, 0,  "한화빌딩 13F, A45",nil,1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 10:00", nil, "파트 회의", nil, nil, 0, "한화빌딩 C1301", nil,1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 11:30", nil, "주간 회의", nil, nil, 0, "한화빌딩 C1302", nil,1)
                ], 1:[
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 12:45", nil, "거점 이동", nil, nil, 0, "여의도손보빌딩 15F",nil,1),
                    (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), " 13:00", nil, "HSP 회의", nil, nil, 0, "여의도손보빌딩 C1502", nil,1),
        //            (TimelinePoint(color: #colorLiteral(red: 0.7489614487, green: 0.749052465, blue: 0.7489304543, alpha: 1), filled: true), backColor: UIColor.clear, "17:45", nil, "퇴근", nil, nil, nil, nil, nil,0)
                ]
                ]
            self.historyTableView.isHidden = false
        }
        
       
        self.historyTableView.reloadData()
            
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        
        let label = UILabel(frame: CGRect(x:(tableView.frame.size.width)/2-10, y: (headerView.frame.size.height)/7-3, width: tableView.bounds.size.width, height: 30))
        //        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        label.textAlignment = .justified
        
        if (section == 0) {
            headerView.backgroundColor = #colorLiteral(red: 1, green: 0.9689273238, blue: 0.8703170419, alpha: 1)
            label.text = "AM"
            label.font = UIFont(name: "NanumBarunGothic", size: 15.0)
            //            label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
            label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        } else {
            headerView.backgroundColor = #colorLiteral(red: 1, green: 0.9689273238, blue: 0.8703170419, alpha: 1)
            label.text = "PM"
            label.font = UIFont(name: "NanumBarunGothic", size: 15.0)
            //            label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
            label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        }
        
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HisTableViewCell", for: indexPath) as! HisTableViewCell
//
//        cell.placeLabel.text = " test"
//
//        // Configure the cell...

        guard let sectionData = data[indexPath.section] else {
            return cell
        }

        let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnails, illustration, checkIn, seatNo, placeNo, placeIcon) = sectionData[indexPath.row]
        

        var timelineFrontColor = UIColor.clear

        if (indexPath.row > 0) {
            timelineFrontColor = sectionData[indexPath.row - 1].1
        }


        
        
        
        //TIMELINE
        cell.timelinePoint = timelinePoint
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = timelineBackColor

        cell.titleLabel.text = title
        cell.titleLabel.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        cell.titleLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
        
        if placeIcon == 0{
            cell.placeIcon.image = nil
        }else if placeIcon == 1{
            cell.placeIcon.image = UIImage(named: "icons8-place-marker-96 (1)")
        }
        //타이틀
        if let lineInfo = lineInfo {
            cell.lineInfoLabel.text = lineInfo
            cell.lineInfoLabel.font = UIFont(name: "NanumBarunGothicBold", size: 16.0)

            cell.lineInfoLabel.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        }
        else {
            cell.lineInfoLabel.text = lineInfo
        }

        if let placeNo = placeNo {
            cell.placeLabel.text = placeNo
            
            cell.placeLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
            
            cell.placeLabel.textColor = #colorLiteral(red: 0.2509582043, green: 0.2509928346, blue: 0.2509464622, alpha: 1)
        }
        else {
            cell.placeLabel.text = nil
        }
//얘가 장소
        if let seatNo = seatNo {
            cell.seatLabel.text = seatNo
            cell.seatLabel.font = UIFont(name: "NanumBarunGothic", size: 15.0)
            
            cell.seatLabel.textColor = #colorLiteral(red: 0.2509582043, green: 0.2509928346, blue: 0.2509464622, alpha: 1)
        }
        else {
            cell.seatLabel.text = nil
        }


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
//
        return cell
    }
    
    
    
    func onoffButtonConnected(sender : UIButton!) {
    }
    
    
    func didChangeSelectedDate(_ date: NSDate) {
        
        // db에서 값을 가져오기
        // tableview. reload
    }
}
