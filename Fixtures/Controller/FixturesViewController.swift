import UIKit
import Alamofire
import SwiftyJSON

class FixturesViewController: UITableViewController {


    var matches : [MatchModel]?
    var fetch = FetchJSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch.delegate = self
        fetch.fetcJSON()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fixture", for: indexPath) as? FixtureTableViewCell,
            let match = matches?[indexPath.row]
            else { fatalError() }
        
        if indexPath.row == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.6196078431, blue: 0.1882352941, alpha: 1)
        }
        cell.homeTeamNameLabel.text = match.homeTeamName
        cell.awayTeamNameLabel.text = match.awayTeamName
        cell.timeLbl.text = match.matchTime
        
        return cell
    }
    
    
    
}


extension FixturesViewController: MatchDelegate{
    
    
    
    func passData(forData matchs: [MatchModel]) {
        
        
        
      DispatchQueue.main.async {
        
        print(matchs.count)
        self.matches = matchs
        self.tableView.reloadData()
       }
        
    }
    
    
}
