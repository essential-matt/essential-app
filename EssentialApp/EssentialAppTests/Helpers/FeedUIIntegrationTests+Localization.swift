import EssentialFeed
import Foundation
import XCTest

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }

    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }

    var feedTitle: String {
        FeedPresenter.title
    }

    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
}
