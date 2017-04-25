class ToDo
  @@to_do_list = []

  define_method(:initialize) do |task|
    @task = task
  end

  define_method(:description) do
    @task
  end

  define_method(:save) do
    @@to_do_list.push(@task)

  end


end
