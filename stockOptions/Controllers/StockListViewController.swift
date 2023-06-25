import Foundation
import UIKit

class StockListViewController: UITableViewController {
    private let vm = StockListViewModel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        Task {
            await populateStocks()
        }
    }
    
    private func configureUI () {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Stocks"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StockCell")
    }
    
    private func populateStocks() async {
        await vm.populateStocks(url: Constants.Urls.allStocks)
    }
}
