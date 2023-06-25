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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.stocks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath)
        let stock = vm.stocks[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = stock.symbol
        content.secondaryText = stock.description
        cell.contentConfiguration = content
         
        return cell
    }
    
    private func populateStocks() async {
        await vm.populateStocks(url: Constants.Urls.allStocks)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
