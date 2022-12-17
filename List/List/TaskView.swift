//
//  TaskView.swift
//  List
//
//  Created by Gunnar Beck on 12/16/22.
//

import Foundation
import SwiftUI


struct ForumPost: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var upvotes: Int
}


struct ForumList: View {
    @State private var forumPosts = [ForumPost]()
    @State private var showNewPostSheet = false
    @State private var newPostTitle = ""
    @State private var newPostContent = ""
    @State private var upvotesTotal = Int().self

    var body: some View {
        NavigationView {
            List {
                ForEach(forumPosts) { forumPost in
                    NavigationLink(destination: ForumDetail(post: forumPost)) {
                        Text(forumPost.title)
                    }
                }
            }
            .navigationBarTitle("Forum")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showNewPostSheet = true
                }) {
                    Text("New Post")
                }
            )
            .sheet(isPresented: $showNewPostSheet) {
                Form {
                    TextField("Title", text: self.$newPostTitle)
                    TextField("Content", text: self.$newPostContent)
                    Button(action: {
                        // Call the backend service to create a new post
                        let newPost = ForumPost(title: self.newPostTitle, content: self.newPostContent, upvotes: self.upvotesTotal)
                        self.forumPosts.append(newPost)
                        self.showNewPostSheet = false
                    }) {
                        Text("Submit")
                    }
                }
            }
        }
    }
}

struct ForumDetail: View {
    @State var post: ForumPost

    var body: some View {
        Form {
            Section(header: Text(post.title)) {
                Text(post.content)
            }
        }
        .navigationBarTitle(post.title)
        .navigationBarItems(trailing:
            Button(action: {
                // Call the backend service to upvote the post
                self.post.upvotes += 1
            }) {
                Text("Upvote")
            }
        )
    }
}

/*

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var completed: Bool
    var points: Int
}

struct TodoList: View {
    @State var todoItems = [TodoItem]()
    @State var totalPoints = 0

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoItems) { todoItem in
                        TodoRow(todoItem: todoItem)
                            .onTapGesture {
                                // Update the total points when the todo item is marked as completed
                                if !todoItem.completed {
                                    self.totalPoints += todoItem.points
                                }
                                //todoItem.completed.toggle()
                            }
                    }
                }
                Text("Total points: \(totalPoints)")
            }
            .navigationBarTitle("Todo List")
        }
    }
}

struct TodoRow: View {
    let todoItem: TodoItem

    var body: some View {
        HStack {
            Text(todoItem.title)
            Spacer()
            Text("\(todoItem.points) points")
            if todoItem.completed {
                Image(systemName: "checkmark.circle.fill")
            }
        }
    }
}





struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var completed: Bool
}

struct TodoList: View {
    @State private var todoItems = [TodoItem]()
    @State private var newTodoTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New todo", text: $newTodoTitle)
                    Button(action: {
                        // Add the new todo item to the list
                        self.todoItems.append(TodoItem(title: self.newTodoTitle, completed: false))
                        self.newTodoTitle = ""
                    }) {
                        Text("Add")
                    }
                }
                List {
                    ForEach(todoItems) { todoItem in
                        TodoRow(todoItem: todoItem)
                    }
                }
            }
            .navigationBarTitle("Todo List")
        }
    }
}

struct TodoRow: View {
    let todoItem: TodoItem

    var body: some View {
        HStack {
            Text(todoItem.title)
            Spacer()
            if todoItem.completed {
                Image(systemName: "checkmark.circle.fill")
            }
        }
    }
}


struct Task {
    var name: String
    var points: Int
    var isComplete: Bool
}


struct PointsView: View {
    @State var points = 0
    
    var body: some View {
        Text("Total points: \(points)")
    }
}


struct TaskListView: View {
    @State var tasks = [Task]()
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                HStack {
                    Toggle(isOn: $task.isComplete) {
                        Text(task.name)
                    }
                    Spacer()
                    Text("\(task.points) points")
                }
            }
        }
    }
}



struct TaskListView: View {
    @State var tasks = [Task]()
    @State var points = 0
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                HStack {
                    Toggle(isOn: $task.isComplete, onToggle: { isComplete in
                        if isComplete {
                            self.updatePoints(for: task)
                        }
                    }) {
                        Text(task.name)
                    }
                    Spacer()
                    Text("\(task.points) points")
                }
            }
        }
    }
    
    func updatePoints(for task: Task) {
        points += task.points
    }
}

*/
