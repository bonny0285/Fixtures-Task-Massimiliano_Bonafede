import UIKit
import Alamofire
import SwiftyJSON

class FixturesViewController: UITableViewController {


    private var matches : [MatchModel]?
    private var fetch = FetchJSON()
    private var timeTable : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch.delegate = self
        fetch.fetcJSON()
        

    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return matches?.count ?? 0
        
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fixture", for: indexPath) as? FixtureTableViewCell,
            let match = matches?[indexPath.row]
            else { fatalError() }
        

        let isoDate = match.matchTime
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from:isoDate)!
        
        
    
       
        cell.homeTeamNameLabel.text = match.homeTeamName
        cell.awayTeamNameLabel.text = match.awayTeamName
        cell.timeLbl.text = "\(date.toString(dateFormat: "HH:mm"))"
        timeTable = "\(date.toString(dateFormat: "MM:dd:yyyy"))"
        
        return cell
    }
    
    
}


extension FixturesViewController: MatchDelegate{
    
    
    
    func passData(forData matchs: [MatchModel]) {
        
    
      DispatchQueue.main.async {
        self.matches = matchs
        self.matches?.sort(by: { $0.matchTime < $1.matchTime })
        self.tableView.reloadData()
       }
        
    }
    
    
}




