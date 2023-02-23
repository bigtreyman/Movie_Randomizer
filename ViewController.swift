import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTextField: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var movieTitles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the list of movie titles from UserDefaults
        movieTitles = UserDefaults.standard.stringArray(forKey: "movieTitles") ?? ["Prince of Persia", "Ready Player One", "The Martian", "Nerve", "Jumanji 2", "Kung fu panda 3", "Now You See me", "WWZ", "Legend", "Silver Lining PLaybook", "How to loose a guy in 9 days", "13 goin on 29.9", "26.9 dresses", "Karate kid", "Pretty Woman", "Legally Blonde", "Hidden Figure", "Gladiator", "Lord of the rings", "47 ronin", "speed", "Sleeping with the enemy", "Imitation game"]
        // Set the text field to display the movie list
        movieTextField.text = movieTitles.joined(separator: "\n")
    }
    
    @IBAction func generateButtonTapped(_ sender: UIButton) {
        let randomIndex = Int.random(in: 0..<movieTitles.count)
        movieTextField.text = movieTitles[randomIndex]
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Add Movie", message: "Enter the title of the movie to add:", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Movie Title"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { _ in
            if let movieTitleToAdd = alertController.textFields?[0].text {
                // Add the movie title to the array of movie titles
                self.movieTitles.append(movieTitleToAdd)
                // Save the updated list of movie titles to UserDefaults
                UserDefaults.standard.set(self.movieTitles, forKey: "movieTitles")
                // Set the text field to display the updated movie list
                self.movieTextField.text = self.movieTitles.joined(separator: "\n")
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Delete Movie", message: "Enter the title of the movie to delete:", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Movie Title"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: { _ in
                if let movieTitleToDelete = alertController.textFields?[0].text {
                    // Remove the movie title from the array of movie titles
                    self.movieTitles.removeAll(where: { $0 == movieTitleToDelete })
                    // Save the updated list of movie titles to UserDefaults
                    UserDefaults.standard.set(self.movieTitles, forKey: "movieTitles")
                    // Set the text field to display the updated movie list
                    self.movieTextField.text = self.movieTitles.joined(separator: "\n")
                }
            })
            
            alertController.addAction(cancelAction)
            alertController.addAction(deleteAction)
            
            present(alertController, animated: true, completion: nil)
        }

                                         }
                                         
