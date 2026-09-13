CREATE TABLE parents (parent TEXT, child TEXT);

INSERT INTO parents VALUES
  ('ace', 'bella'),
  ('ace', 'charlie'),
  ('daisy', 'hank'),
  ('finn', 'ace'),
  ('finn', 'daisy'),
  ('finn', 'ginger'),
  ('ellie', 'finn');

CREATE TABLE dogs (name TEXT, fur TEXT, height INTEGER);

INSERT INTO dogs VALUES
  ('ace',     'long',  26),
  ('bella',   'short', 52),
  ('charlie', 'long',  47),
  ('daisy',   'long',  46),
  ('ellie',   'short', 35),
  ('finn',    'curly', 32),
  ('ginger',  'short', 28),
  ('hank',    'curly', 31);

CREATE TABLE sizes (size TEXT, min INTEGER, max INTEGER);

INSERT INTO sizes VALUES
  ('toy',      24, 28),
  ('mini',     28, 35),
  ('medium',   35, 45),
  ('standard', 45, 60);


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM parents JOIN dogs on parent = name ORDER BY height DESC;

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name,size FROM dogs JOIN sizes ON height > min AND height <= max;

-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT a.child AS child1,b.child AS child2 FROM parents AS a JOIN parents AS b ON a.parent = b.parent AND a.child <  b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
 SELECT "The two siblings, " || child1 || " and " || child2 || ", have the same size: " || a.size
 FROM siblings
 JOIN size_of_dogs AS a ON child1 = a.name
 JOIN size_of_dogs AS b ON child2 = b.name
 WHERE a.size = b.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) FROM dogs GROUP BY fur HAVING MIN(height) >= 0.7*AVG(height) AND MAX(height) <= 1.3*AVG(height);

