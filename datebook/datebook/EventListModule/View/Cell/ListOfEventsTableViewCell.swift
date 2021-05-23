//
//  ListOfEventsTableViewCell.swift
//  dateBook
//
//  Created by mac on 30.04.2021.
//

import UIKit

class ListOfEventsTableViewCell: UITableViewCell {
    
    @IBOutlet var eventLabel: UILabel!
    @IBOutlet var dataStartLabel: UILabel!
    @IBOutlet var dataEndLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(event: EventModel) {
        eventLabel?.text = event.name
        dataStartLabel?.text = event.dateStart.convertFromDoubleToString(timeStamp: event.dateStart)
        dataEndLabel?.text = event.dateEnd.convertFromDoubleToString(timeStamp: event.dateEnd)
    }
}
