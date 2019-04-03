# Cuboid must have...
  # position x-y-z
  # size W(x)-H(y)-D(z)

# Objections
  # calculate corners
  # detect collisions
  # rotate 90 degrees (mind boundaries)

defmodule Cuboid do
  defstruct position: %{ x: 0, y: 0, z: 0 }, dimensions: %{ w: 0, h: 0, d: 0 }

  # cube = Cuboid.create_cuboid(%{x: <int>, y: <int>, z: <int>}, %{ w: <int>, h: <int>, d: <int> })
  def new_cuboid(position, dimensions, current_cuboids) do
    new = %Cuboid{
      position: %{ x: position.x, y: position.y, z: position.z },
      dimensions: %{ w: dimensions.w, h: dimensions.h, d: dimensions.d }}
    test = new |> vertices |> position_min_max |> intersects?(current_cuboids)
    if elem(test, 1) === false, do: new, else: nil
  end


  def move_to(%Cuboid{} = cuboid, position) do
    cuboid
    |> Map.replace!(:position, %{ x: position.x, y: position.y, z: position.z })
    |> IO.inspect()
    # |> modify position
    # |> check intersect
    # |> return new position
  end

  def vertices(%Cuboid{} = cuboid) do
    {:vertices, [
      { :front_bottom_left, cuboid.position },
      { :front_bottom_right, %{ x: cuboid.position.x + cuboid.dimensions.w, y: cuboid.position.y, z: cuboid.position.z }},
      { :back_bottom_right, %{ x: cuboid.position.x + cuboid.dimensions.w, y: cuboid.position.y, z: cuboid.position.z + cuboid.dimensions.d }},
      { :back_bottom_left, %{ x: cuboid.position.x, y: cuboid.position.y, z: cuboid.position.z + cuboid.dimensions.d }},
      { :front_top_left, %{ x: cuboid.position.x, y: cuboid.position.y + cuboid.dimensions.h, z: cuboid.position.z }},
      { :front_top_right, %{ x: cuboid.position.x + cuboid.dimensions.w, y: cuboid.position.y + cuboid.dimensions.h, z: cuboid.position.z }},
      { :back_top_right, %{ x: cuboid.position.x + cuboid.dimensions.w, y: cuboid.position.y + cuboid.dimensions.h, z: cuboid.position.z + cuboid.dimensions.d }},
      { :back_top_left, %{ x: cuboid.position.x, y: cuboid.position.y + cuboid.dimensions.h, z: cuboid.position.z + cuboid.dimensions.d }}
    ]}
  end

  def position_min_max(list, acc \\ nil)
  def position_min_max({:vertices, []}, acc), do: acc
  def position_min_max({:vertices, [head|tail] }, nil)do
    position_min_max({:vertices, tail}, %{
      x: {elem(head,1).x, elem(head,1).x},
      y: {elem(head,1).y, elem(head,1).y},
      z: {elem(head,1).z, elem(head,1).z}})
  end
  def position_min_max({:vertices, [head|tail] }, acc) do
    position_min_max({:vertices, tail},
      %{ x: { (if elem(head,1).x < elem(acc.x,0), do: elem(head,1).x, else: elem(acc.x,0)),
        (if elem(head,1).x > elem(acc.x,1), do: elem(head,1).x, else: elem(acc.x,1)) },
        y: { (if elem(head,1).y < elem(acc.y,0), do: elem(head,1).y, else: elem(acc.y,0)),
        (if elem(head,1).y > elem(acc.y,1), do: elem(head,1).y, else: elem(acc.y,1)) },
        z: { (if elem(head,1).z < elem(acc.z,0), do: elem(head,1).z, else: elem(acc.z,0)),
        (if elem(head,1).z > elem(acc.z,1), do: elem(head,1).z, else: elem(acc.z,1)) }})
  end

  def intersects?(cuboid_a, []), do: { :ok, false }
  def intersects?(cuboid_a, cuboid_b) do
    if (elem(cuboid_a.x, 0) < elem(cuboid_b.x, 1) && elem(cuboid_a.x, 1) > elem(cuboid_b.x, 0)) &&
    (elem(cuboid_a.y, 0) < elem(cuboid_b.y, 1) && elem(cuboid_a.y, 1) > elem(cuboid_b.y, 0)) &&
    (elem(cuboid_a.z, 0) < elem(cuboid_b.z, 1) && elem(cuboid_a.z, 1) > elem(cuboid_b.z, 0)) do
      {:ok, false}
    else
      {:error, true}
    end
  end

end
