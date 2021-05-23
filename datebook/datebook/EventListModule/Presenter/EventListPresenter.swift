//
//  EventListPresenter.swift
//  dateBook
//
//  Created by mac on 24.04.2021.
//

import Foundation

protocol EventListViewProtocol: class {
    func setEvents(_ events: [EventModel])
    func showAlert() 
}

protocol EventListPresenterProtocol: class {
    func didSelectDate(_ date: Date)
    func viewDidLoad()
    var events: [EventModel]? { get }
}

class EventListPresenter: EventListPresenterProtocol {
    weak var view: EventListViewProtocol?
    private let jsonEventsService: EventService
    var events: [EventModel]?
  
    required init(view: EventListViewProtocol, jsonEventsService: EventService) {
        self.view = view
        self.jsonEventsService = jsonEventsService
    }
    
    func viewDidLoad() {
        
        jsonEventsService.getEvents() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let events):
                self.events = events
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func didSelectDate(_ date: Date) {
        
        let currentDateString = date.convertFromDateToString()
        
        if let filteredEvents = events?.filter({$0.dateStart.convertFromTimeStampToString(timeStamp: $0.dateStart) == currentDateString }) {
            view?.setEvents(filteredEvents)
        } else {
            view?.showAlert()
        }
    }
}
