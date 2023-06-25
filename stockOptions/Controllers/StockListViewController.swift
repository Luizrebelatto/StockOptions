import Foundation
import UIKit

class StockListViewController: UITableViewController {
    private let vm = StockListViewModel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await populateStocks()
        }
    }
    
    private func populateStocks() async {
        await vm.populateStocks(url: Constants.Urls.allStocks)
    }
}
