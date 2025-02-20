//
//  QuickOpenView.swift
//  CodeEdit
//
//  Created by Pavel Kasila on 20.03.22.
//

import SwiftUI
import WorkspaceClient

struct QuickOpenView: View {
    @ObservedObject var state: WorkspaceDocument.QuickOpenState
    @State var selectedItem: WorkspaceClient.FileItem?
    var onClose: () -> Void

    var body: some View {
        VStack(spacing: 0.0) {
            VStack {
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 12)
                        .offset(x: 0, y: 1)
                    TextField("Open Quickly", text: $state.openQuicklyQuery)
                        .font(.system(size: 20, weight: .light, design: .default))
                        .textFieldStyle(.plain)
                        .onReceive(
                            state.$openQuicklyQuery
                                .debounce(for: .seconds(0.4), scheduler: DispatchQueue.main)
                        ) { _ in
                            state.fetchOpenQuickly()
                        }
                }
                    .padding(16)
                    .foregroundColor(.primary.opacity(0.85))
                    .background(BlurView(material: .sidebar, blendingMode: .behindWindow))
            }
            Divider()
            NavigationView {
                List(state.openQuicklyFiles, id: \.id) { file in
                    NavigationLink(tag: file, selection: $selectedItem) {
                        QuickOpenPreviewView(item: file)
                    } label: {
                        QuickOpenItem(baseDirectory: state.workspace.fileURL!, fileItem: file)
                    }
                    .onTapGesture(count: 2) {
                        state.workspace.openFile(item: file)
                        self.onClose()
                    }
                    .onTapGesture(count: 1) {
                        self.selectedItem = file
                    }
                }
                    .removeBackground()
                    .frame(minWidth: 250, maxWidth: 250)
                if state.openQuicklyFiles.isEmpty {
                    EmptyView()
                } else {
                    Text("Select a file to preview")
                }
            }
        }
            .background(BlurView(material: .sidebar, blendingMode: .behindWindow))
            .edgesIgnoringSafeArea(.vertical)
            .frame(minWidth: 600,
               minHeight: self.state.isShowingOpenQuicklyFiles ? 400 : 28,
               maxHeight: self.state.isShowingOpenQuicklyFiles ? .infinity : 28)
    }
}

struct QuickOpenView_Previews: PreviewProvider {
    static var previews: some View {
        QuickOpenView(state: .init(.init()), onClose: {})
    }
}
