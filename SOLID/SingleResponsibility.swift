import Foundation

class Journal: CustomStringConvertible {
    var description: String {
        return entries.joined(separator: "\n")
    }
    
    var entries = [String]()
    var count = 0

    func addEntry(_ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }

    func removeEntry(_ index: Int) {
        entries.remove(at: index)
    }

//    func save(_ filename: String, _ overwite: Bool = false) {
//        // save to a file
//    }
//
//    func load(_ filename: String) {}
//    func load(_ url: URL) {}
}

class Persistence {
    func saveToFile(_ journal: Journal,
                    _ fileName: String,
                    _ overwrite: Bool = false) {}
}

func main() {
    let j = Journal()
    let _ = j.addEntry("I cried today")
    let bug = j.addEntry("I ate a bug")
    print(j)
    
    j.removeEntry(bug)
    print("===")
    print(j)

    let p = Persistence()
    let filename = "sadfads"
    p.saveToFile(j, filename)
}

//main()
