import UIKit

public final class ErrorView: UIView {
    @IBOutlet private var label: UILabel!

    public var message: String? {
        get { isVisible ? label.text : nil }
        set { setMessageAnimated(newValue) }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        label.text = nil
        alpha = .zero
    }

    private var isVisible: Bool {
        alpha > .zero
    }

    private func setMessageAnimated(_ message: String?) {
        guard let message = message else {
            hideMessageAnimated()
            return
        }
        showAnimated(message)
    }

    private func showAnimated(_ message: String) {
        label.text = message
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }

    @IBAction private func hideMessageAnimated() {
        UIView.animate(withDuration: 0.25,
                       animations: { self.alpha = .zero },
                       completion: { completed in
            if completed { self.label.text = nil }
        })
    }
}
